let clients = ref []
let score = ref 501

let home_page current_score = 
  <html>
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>

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
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>

  <script>
    function send_score(score) {
      let mult = parseInt(document.querySelector('input[name="radioMultiplier"]:checked').value);
      fetch("/api/" + score * mult, {method: "GET"});
    }
  </script>

  <body>
    <div class="row p-2">
      <div class="col-4">
          <div class="form-check">
              <input class="form-check-input" type="radio" value="1" name="radioMultiplier" id="radioSingle" checked>
              <label class="form-check-label" for="radioSingle">
                Single
              </label>
          </div>
          <div class="form-check">
              <input class="form-check-input" type="radio" value="2" name="radioMultiplier" id="radioDouble">
              <label class="form-check-label" for="radioDouble">
                Double
              </label>
          </div>
          <div class="form-check">
              <input class="form-check-input" type="radio" value="3" name="radioMultiplier" id="radioTriple">
              <label class="form-check-label" for="radioTriple">
                Triple
              </label>
          </div>
      </div>
      <div class="col-8">
          <div class="flex-row d-flex my-1">
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(1)">1</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(2)">2</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(3)">3</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(4)">4</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(5)">5</button>
          </div>
          <div class="flex-row d-flex my-1">
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(6)">6</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(7)">7</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(8)">8</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(9)">9</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(10)">10</button>
          </div>
          <div class="flex-row d-flex my-1">
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(11)">11</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(12)">12</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(13)">13</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(14)">14</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(15)">15</button>
          </div>
          <div class="flex-row d-flex my-1">
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(16)">16</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(17)">17</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(18)">18</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(19)">19</button>
              <bu<html>
              <head>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
              </head>
              
              <script>
                function send_score(score) {
                  let mult = parseInt(document.querySelector('input[name="radioMultiplier"]:checked').value);
                  fetch("/api/" + score * mult, {method: "GET"});
                }
              </script>
              
              <body>
                <div class="row p-2">
                  <div class="col-4">
                      <div class="form-check">
                          <input class="form-check-input" type="radio" value="1" name="radioMultiplier" id="radioSingle" checked>
                          <label class="form-check-label" for="radioSingle">
                            Single
                          </label>
                      </div>
                      <div class="form-check">
                          <input class="form-check-input" type="radio" value="2" name="radioMultiplier" id="radioDouble">
                          <label class="form-check-label" for="radioDouble">
                            Double
                          </label>
                      </div>
                      <div class="form-check">
                          <input class="form-check-input" type="radio" value="3" name="radioMultiplier" id="radioTriple">
                          <label class="form-check-label" for="radioTriple">
                            Triple
                          </label>
                      </div>
                  </div>
                  <div class="col-8">
                      <div class="flex-row d-flex my-1">
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(1)">1</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(2)">2</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(3)">3</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(4)">4</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(5)">5</button>
                      </div>
                      <div class="flex-row d-flex my-1">
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(6)">6</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(7)">7</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(8)">8</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(9)">9</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(10)">10</button>
                      </div>
                      <div class="flex-row d-flex my-1">
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(11)">11</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(12)">12</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(13)">13</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(14)">14</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(15)">15</button>
                      </div>
                      <div class="flex-row d-flex my-1">
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(16)">16</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(17)">17</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(18)">18</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(19)">19</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(20)">20</button>
                      </div>
                      <div class="flex-row d-flex my-1">
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(0)">0</button>
                          <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(25)">25</button>
                      </div>
              
                  </div>
                </div>
              </body>
              </html>tton class="btn btn-dark mx-2 flex-fill" onclick="send_score(20)">20</button>
          </div>
          <div class="flex-row d-flex my-1">
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(0)">0</button>
              <button class="btn btn-dark mx-2 flex-fill" onclick="send_score(25)">25</button>
          </div>

      </div>
    </div>
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