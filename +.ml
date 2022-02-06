(* +.ml: The + Programming Language Interpreter in Ocaml v0.0.1

   By. Kyumin Nam (godbros.miniprime@gmail.com)

   Compile with: ocamlopt -o + +.ml
   Usage: + <File>
*)

let accumlator () =
  ()
;;

let err_unknown c =
  print_string "Unknown command: "; print_char c;
  print_newline ();
  exit 1
;;

let err_unexpected_eof () =
  print_endline "Unexpected end of file";
  exit 1
;;

let interpret chan =
  try let c = input_char chan in
    begin
      match c with
	  '+' -> accumlator ()
	| _ -> err_unknown c
    end
  with End_of_file -> err_unexpected_eof ()
;;

let main argc argv =
  if argc <> 2 then begin
    print_string "Usage: "; print_string argv.(0);
    print_endline " <File>"
  end else try
    let chan = open_in argv.(1) in
      interpret chan;
      close_in chan
  with Sys_error s -> print_endline s
;;

main (Array.length Sys.argv) Sys.argv

(* +.ml ends here *)
