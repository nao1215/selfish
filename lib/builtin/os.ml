open Unix

(*
  This module is used to get the username of the current user.
  It uses the Unix module to get the user id and then uses the getpwuid function to get the user info.
  The user info is then used to get the username.   
*)
let user_name () =
  let uid = getuid () in
  let userinfo = getpwuid uid in
  userinfo.pw_name

(*
  This module is used to get the hostname of the current machine.
  It uses the Unix module to get the hostname.   
*)
let hostname () = gethostname()

(*
  This module is used to get the current directory.   
*)
let cwd () = getcwd ()


(*
  This module is used to get the home directory of the current user.
  It uses the Unix module to get the home directory.
  If the HOME environment variable is not set, return empty string.
*)
let home_dir () =
  match Sys.getenv_opt "HOME" with
  | Some home_dir -> home_dir
  | None -> ""

let replace_home_path_with_tilde path =
  let home = home_dir () in
  if String.length path >= String.length home &&
     String.sub path 0 (String.length home) = home then
    "~" ^ String.sub path (String.length home) (String.length path - String.length home)
  else
    path

