Test the (dialect ...) stanza inside the dune-project file.

  $ dune exec --root good ./main.exe
  Entering directory 'good'
  Entering directory 'good'

  $ dune build --root good --display short @fmt
  Entering directory 'good'
      ocamldep .fmt.eobjs/fmt.ml.d
        ocamlc .fmt.eobjs/byte/fmt.{cmi,cmo,cmt}
      ocamlopt .fmt.eobjs/native/fmt.{cmx,o}
      ocamlopt fmt.exe
           fmt .formatted/main.mfi
           fmt .formatted/main.mf

  $ dune build --root bad1
  Entering directory 'bad1'
  File "dune-project", line 9, characters 1-74:
   9 |  (name d)
  10 |  (implementation (extension foo2))
  11 |  (interface (extension bar2)))
  Error: dialect "d" is already defined
  [1]

  $ dune build --root bad2
  Entering directory 'bad2'
  File "dune-project", line 9, characters 1-74:
   9 |  (name d2)
  10 |  (implementation (extension foo))
  11 |  (interface (extension bar2)))
  Error: extension "foo" is already registered by dialect "d"
  [1]

  $ dune build --root bad3
  Entering directory 'bad3'
  File "dune-project", line 5, characters 28-32:
  5 |  (implementation (extension .foo))
                                  ^^^^
  Error: extension must not contain '.'
  [1]
