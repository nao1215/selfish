open Printf

let cd args =
  match args with
  | [] -> Sys.chdir (Os.home_dir())
  | [dir] -> Sys.chdir dir
  | _ -> printf "cd: too many arguments\n"