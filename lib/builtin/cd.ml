open Printf

let cd args =
  try
    match args with
    | [] ->
        Sys.chdir (Os.home_dir ());
        0
    | [ dir ] ->
        Sys.chdir dir;
        0
    | _ ->
        printf "cd: too many arguments\n";
        1
  with Sys_error msg ->
    printf "cd: %s\n" msg;
    1
