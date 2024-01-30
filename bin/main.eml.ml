let clients = ref []
let score = ref 501

let home_page current_score = 
  <html>
  <script>
  var socket = new WebSocket("ws://" + window.location.host + "/sockets/score");

  socket.onopen = function () {
    console.log("Socket opened");
  };

  socket.onclose = function () {
    console.log("Socket closed");
  };

  socket.onmessage = function(e) {
    document.getElementById("score").innerHTML = e.data;
  };

  </script>
  <body>
    <h1 id="score"><%d current_score%>!</h1>
    <!--<image src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=localhost:8080/score"/>-->
  </body>
  </html>

let score_page =
  <html>
  <script>
    function send_score(score) {
      fetch("/api/" + score, {method: "GET"});
    }
  </script>
  <body>
    <button onclick="send_score(10)">10</button>
    <button onclick="send_score(20)">20</button>
  </body>
  </html>



let () =
  Dream.run ~interface:"0.0.0.0"
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ ->
      Dream.html (home_page !score));
    
    Dream.get "/score" (fun _ ->
      Dream.html score_page);
    
    Dream.get "/sockets/score" (fun _ ->
      Dream.websocket (fun websocket -> 
        clients := websocket :: !clients;
        let rec loop () =
          match%lwt Dream.receive websocket with
          | Some x -> 
            (try
              score := !score - int_of_string x;
            with Failure _ -> ()
            );
            let%lwt () = Lwt_list.iter_p (fun client -> Dream.send client x) !clients in
            loop ()
          | _ -> Lwt.return_unit (**Dream.close_websocket websocket*)
        in loop ()));

    Dream.get "/api/:score" (fun req -> 
      score := !score - int_of_string (Dream.param req "score");
      let new_score = string_of_int !score in
      let%lwt () = Lwt_list.iter_p (fun client -> Dream.send client new_score) !clients in
      Dream.json new_score);
  ]