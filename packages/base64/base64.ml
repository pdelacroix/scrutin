type alphabet = { emap : int array; dmap : int array }

external btoa : string -> string = "btoa" [@@bs.val]

external atob : string -> string = "atob" [@@bs.val]

let decode ?pad ?alphabet ?off ?len input =
  try
    Ok (atob input)
  with
  | _ -> Error (`Msg "Invalid base64 input")

let encode ?(pad = true) ?alphabet ?off ?len input =
  try
    Ok (btoa input)
  with
  | _ -> Error (`Msg "Invalid character")
