(lang dune 3.12)

(name darts_eref)

(generate_opam_files true)

(source
 (github bezunyl/darts_eref))

(authors "bened")

(maintainers "bened")

(license LICENSE)

(package
 (name darts_eref)
 (synopsis "Darts electronic referee")
 (description "A front-end for keeping track of darts games.")
 (depends ocaml dune)
 (tags
  (darts webapp)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
