open Printf

let is_builtin cmd =
  match cmd with
  | "exit" -> true
  | "cd" -> true 
  | _ -> false
  
let execute_builtin cmd args =
  match cmd with
  | "exit" -> exit 0
  | "cd" -> Cd.cd args
  | _ -> printf "Command: %s, Args: [%s]\n" cmd (String.concat "; " args) (* TODO: this is debug print *)

