open Printf

let cd args =
  try
    match args with
    | [] -> Sys.chdir (Os.home_dir())
    | [dir] -> Sys.chdir dir
    | _ -> printf "cd: too many arguments\n"
  with
    | Sys_error msg -> printf "cd: %s\n" msg