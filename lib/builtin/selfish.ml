open Printf

let is_builtin cmd =
  match cmd with "exit" -> true | "cd" -> true | "pwd" -> true | _ -> false

let execute_builtin cmd args =
  try
    match cmd with
    | "exit" -> Exit.builtin_exit args
    | "cd" -> Cd.cd args
    | "pwd" -> Pwd.pwd args
    | _ ->
        printf "Command: %s, Args: [%s]\n" cmd (String.concat "; " args);
        1 (* Return error status *)
  with Failure msg ->
    eprintf "%s: %s\n" cmd msg;
    1 (* BUG: waiting until the process terminates *)
