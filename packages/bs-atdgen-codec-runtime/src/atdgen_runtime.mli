type json = [ 
  | `Null
  | `Bool of bool
  | `Int of int
  | `Intlit of string
  | `Float of float
  | `String of string
  | `Assoc of (string * json) list
  | `List of json list
  | `Tuple of json list
  | `Variant of string * json option
]

module Util : sig
  type 'a ocaml_array = 'a array

  module Json : sig
    (* type t *)
    type lexer_state = {
      buf : Buffer.t;
      mutable lnum : int;
      mutable bol : int;
      mutable fname : string option;
    }

    type 'a reader_orig = lexer_state -> Lexing.lexbuf -> 'a
    type 'a writer_orig = Buffer.t -> 'a -> unit

    type 'a reader = Js.Json.t -> 'a
    type 'a writer = 'a -> Js.Json.t
  end
end


val jsont_of_json : json -> Js.Json.t

val json_of_jsont : Js.Json.t -> json
