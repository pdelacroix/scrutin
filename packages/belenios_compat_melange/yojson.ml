module Safe = struct
  type t = [ 
    | `Null
    | `Bool of bool
    | `Int of int
    | `Intlit of string
    | `Float of float
    | `String of string
    | `Assoc of (string * t) list
    | `List of t list
    | `Tuple of t list
    | `Variant of string * t option
  ]

  let to_string json =
    Atdgen_runtime.jsont_of_json json
    |> Js.Json.stringify

  let from_string s =
    Js.Json.parseExn s
    |> Atdgen_runtime.json_of_jsont

  let read_json state buf =
    Buffer.contents buf
    |> Js.Json.parseExn
    |> Atdgen_runtime.json_of_jsont

  let write_json buf json =
    Atdgen_runtime.jsont_of_json json
    |> Js.Json.stringify
    |> Buffer.add_string buf

  let read_space _x _y = ()

  let read_array _x _y _z =
    failwith "not implemented"
end

let json_error _x =
  failwith "not implemented"
