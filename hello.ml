let () = 
  let pid = Unix.create_process Sys.argv.(1) (Array.sub Sys.argv 1 (Array.length Sys.argv - 1))  Unix.stdin Unix.stdout Unix.stderr in
  let (_, status) = Unix.waitpid [] pid in
  match status with
  | WEXITED code -> exit code
  | WSIGNALED _
  | WSTOPPED _ -> failwith "signalled" 
