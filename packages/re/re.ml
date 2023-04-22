type re = Js.Re.t

module Pcre = Pcre

module Group = struct
  type t = Js.Re.result
end
(**)
(* module Pcre = struct *)
(* type regexp = Js.Re.t *)
(**)
(* type flag = [ `CASELESS | `MULTILINE | `ANCHORED ] *)
(**)
(* type groups = Js.Re.result *)
(**)
(* let regexp ?flags str = Js.Re.fromString str *)
(**)
(* let exec ~rex ?pos str = *)
(*   match Js.Re.exec_ rex str with *)
(*   | Some res -> res *)
(*   | None -> raise Not_found *)
(**)
(* let get_substring groups index = *)
(*   let captures = Js.Re.captures groups in *)
(*   let capture = Js.Array.unsafe_get captures index in *)
(*   match Js.Nullable.to_opt capture with *)
(*   | Some str -> str *)
(*   | None -> "" *)
(* end *)
