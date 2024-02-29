open Printf

module Echo = struct
  let echo args =
    let print_newline = ref true in
    (* By default, print newline *)
    let rec parse_args args =
      match args with
      | "-n" :: rest ->
          print_newline := false;
          parse_args rest
      | str :: rest ->
          printf "%s" str;
          parse_args rest
      | [] -> ()
    in
    parse_args args;
    if !print_newline then Printf.printf "\n";
    0 (* Return success status *)
end
