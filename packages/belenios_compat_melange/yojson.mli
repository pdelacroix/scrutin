module Safe : sig
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

  val to_string : t -> string

  val from_string : string -> t

  val read_json : _ -> Buffer.t -> t

  val write_json : Buffer.t -> t -> unit

  val read_space : _ -> _ -> unit

  val read_array : _ -> _ -> _ -> unit
end

val json_error : _ -> unit
