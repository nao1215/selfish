open Printf
open Builtin
  
(*
  Main loop of the REPL
  It reads a line from the standard input, and then prints it back
  It also checks if the input is a built-in command
*)
let rec main_loop () =
  printf "> %!";
  match input_line stdin with
  | exception End_of_file -> ()
  | input -> begin
      let parts = String.split_on_char ' ' input in
      match parts with
      | cmd :: args -> 
          if Selfish.is_builtin cmd then
            Selfish.execute_builtin cmd args
          else begin (* TODO: Search command from PATH *)
            printf "%s\n" input;
            main_loop ()
          end
      | [] -> main_loop ()
    end

let () = main_loop ()