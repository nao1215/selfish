open Printf
open Echo

(* Check if the command is a built-in command *)
let is_builtin cmd =
  match cmd with
  | "exit" -> true
  | "cd" -> true
  | "pwd" -> true
  | "echo" -> true
  | _ -> false

(* Execute the built-in command *)
let execute_builtin cmd args =
  try
    match cmd with
    | "exit" -> Exit.builtin_exit args
    | "cd" -> Cd.cd args
    | "pwd" -> Pwd.pwd args
    | "echo" -> Echo.echo args
    | _ ->
        printf "Command: %s, Args: [%s]\n" cmd (String.concat "; " args);
        1 (* Return error status *)
  with Failure msg ->
    eprintf "%s: %s\n" cmd msg;
    1 (* BUG: waiting until the process terminates *)
