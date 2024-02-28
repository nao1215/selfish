let builtin_exit args =
  match args with
  | [] -> exit 0
  | arg :: _ -> (
      try
        let exit_code = int_of_string arg in
        exit exit_code
      with Failure _ -> exit 2)
