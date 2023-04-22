type regexp = Js.Re.t

type flag = [ `CASELESS | `MULTILINE | `ANCHORED ]

type groups = Js.Re.result

val regexp : ?flags:(flag list) -> string -> regexp
(** [re ~flags s] compiles the regexp [s] using the pcre syntax. *)

val exec : rex:regexp -> ?pos:int -> string -> groups
(** Equivalent to {!Core.exec}. *)

val get_substring : groups -> int -> string
(** Equivalent to {!Core.Group.get}. *)
