type json =
  [ `Assoc of (string * json) list
  | `Bool of bool
  | `Float of float
  | `Int of int
  | `Intlit of string
  | `List of json list
  | `Null
  | `String of string
  | `Tuple of json list
  | `Variant of string * json option ]

module Util = struct
  type 'a ocaml_array = 'a array

  module Json = struct
    (* type t *)
    type lexer_state = {
      buf : Buffer.t;
      mutable lnum : int;
      mutable bol : int;
      mutable fname : string option;
    }

    type 'a reader_orig = lexer_state -> Lexing.lexbuf -> 'a
    type 'a writer_orig = Buffer.t -> 'a -> unit

    (* type 'a reader = json -> 'a *)
    (* type 'a writer = 'a -> json *)

    type 'a reader = Js.Json.t -> 'a
    type 'a writer = 'a -> Js.Json.t
  end
end

let rec jsont_of_json json =
  let open Json.Encode in
  match json with
  | `Bool b -> bool b
  | `Float f -> float f
  | `String s -> string s
  | `Int i -> int i
  | `Intlit s -> int @@ int_of_string s
  | `Null -> null
  | `List l -> list jsont_of_json l
  | `Assoc a -> dict jsont_of_json @@ Js.Dict.fromList a
  | `Tuple [a;b] -> tuple2 jsont_of_json jsont_of_json (a, b)
  | `Tuple [a;b;c] -> tuple3 jsont_of_json jsont_of_json jsont_of_json (a, b, c)
  | `Tuple [a;b;c;d] -> tuple4 jsont_of_json jsont_of_json jsont_of_json jsont_of_json (a, b, c, d)
  | `Tuple t -> list jsont_of_json t
  | `Variant (name, options) -> bool false

let rec json_of_jsont jsont =
  match Js.Json.classify jsont with
  | JSONFalse -> `Bool false
  | JSONTrue -> `Bool true
  | JSONNull -> `Null
  | JSONString s -> `String s
  | JSONNumber f -> `Float f
  | JSONObject d -> `Assoc (Js.Dict.entries d |> Js.Array.map (fun (k, v) -> (k, json_of_jsont v)) |> Belt.List.fromArray)
  | JSONArray a -> `List (List.map json_of_jsont @@ Belt.List.fromArray a)
