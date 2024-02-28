open Printf
open Builtin

(* Execute a command and return its exit status *)
let execute_external_command cmd args =
  let command = String.concat " " (cmd :: args) in
  let exit_status = Sys.command command in
  exit_status

(* Main loop of the selfish shell *)
let rec main_loop () =
  let user = Os.user_name () in
  let host = Os.hostname () in
  let cwd = Os.replace_home_path_with_tilde (Os.cwd ()) in
  printf "%s@%s:%s $ %!" user host cwd;

  match input_line stdin with
  | exception End_of_file -> ()
  | input -> (
      let parts = String.split_on_char ' ' input in
      match parts with
      | cmd :: args ->
          if Selfish.is_builtin cmd then
            let _ = Selfish.execute_builtin cmd args in
            main_loop ()
          else
            (* Execute external command and save its exit status *)
            let _ = execute_external_command cmd args in
            main_loop ()
      | [] -> main_loop ())

let () = main_loop ()
