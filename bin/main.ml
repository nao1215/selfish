open Printf
open Builtin
open Unix

(* Check if a command exists in PATH *)
let exists_external_command cmd =
  let path = Unix.getenv "PATH" in
  let paths = String.split_on_char ':' path in
  let rec exists_in_paths cmd = function
    | [] -> false
    | p :: ps ->
        let cmd_with_path = Filename.concat p cmd in
        if Sys.file_exists cmd_with_path then true else exists_in_paths cmd ps
  in
  exists_in_paths cmd paths

(* Execute a command and return its exit status *)
let execute_external_command cmd args =
  try execvp cmd (Array.of_list (cmd :: args))
  with Unix.Unix_error (err, _, _) ->
    printf "Error: %s\n" (Unix.error_message err);
    1

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
          else if exists_external_command cmd then
            let _ = execute_external_command cmd args in
            main_loop ()
          else (
            printf "Command not found: %s\n" cmd;
            main_loop ())
      | [] -> main_loop ())

let () = main_loop ()
