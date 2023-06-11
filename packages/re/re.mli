type re = Js.Re.t

(** Manipulate matching groups. *)
module Group : sig
  type t = Js.Re.result
  (** Information about groups in a match. As is conventional, every
      match implicitly has a group 0 that covers the whole match, and
      explicit groups are numbered from 1. *)
end

module Pcre : sig
  type regexp = Js.Re.t

  type flag = [ `CASELESS | `MULTILINE | `ANCHORED ]

  type groups = Js.Re.result

  val regexp : ?flags:(flag list) -> string -> regexp
  (** [re ~flags s] compiles the regexp [s] using the pcre syntax. *)

  val exec : rex:regexp -> ?pos:int -> string -> groups
  (** Equivalent to {!Core.exec}. *)

  val get_substring : groups -> int -> string
  (** Equivalent to {!Core.Group.get}. *)
end
