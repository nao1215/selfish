open Printf

(* Function to get the current working directory *)
let get_current_directory follow_symlinks =
  if follow_symlinks then Sys.getcwd () else Unix.readlink (Unix.getcwd ())

(* Function to print the absolute pathname of the current working directory *)
let pwd args =
  let follow_symlinks = ref true in
  let rec check_options = function
    | [] -> ()
    | "-L" :: rest ->
        follow_symlinks := true;
        check_options rest
    | "-P" :: rest ->
        follow_symlinks := false;
        if List.mem "-L" rest then follow_symlinks := true;
        check_options rest
    | opt :: _ -> failwith (sprintf "invalid option %s" opt)
  in
  check_options args;

  try
    let cwd = get_current_directory !follow_symlinks in
    printf "%s\n" cwd;
    0
  with Sys_error msg ->
    eprintf "pwd: %s\n" msg;
    1
