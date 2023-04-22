type t = [`Hex of string]

let of_string ?(ignore = []) s = `Hex s

let to_string (`Hex s) = s
