open Printf
open Builtin

(*
  Main loop of the selfish shell.
  It reads a line from the standard input, and then prints it back
  It also checks if the input is a built-in command
*)
let rec main_loop () =
  let user = Os.user_name () in
  let host = Os.hostname () in
  let cwd = Os.replace_home_path_with_tilde (Os.cwd ()) in
  Printf.printf "%s@%s:%s $ %!" user host cwd;

  match input_line stdin with
  | exception End_of_file -> ()
  | input -> begin
    let parts = String.split_on_char ' ' input in
    match parts with
    | cmd :: args -> 
        if Selfish.is_builtin cmd then begin
          Selfish.execute_builtin cmd args;
          main_loop () 
        end
        else begin (* TODO: Search command from PATH *)
          printf "%s\n" input;
          main_loop ()
        end
    | [] -> main_loop ()
  end

let () = main_loop ()