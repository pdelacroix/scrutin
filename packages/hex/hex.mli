(** Hexadecimal encoding.

    [Hex] defines hexadecimal encodings for {{!char}characters},
    {{!string}strings} and {{!cstruct}Cstruct.t} buffers. *)

type t = [`Hex of string]
(** The type var hexadecimal values. *)

(** {1:char Characters} *)

(* val of_char: char -> char * char *)
(** [of_char c] is the the hexadecimal encoding of the character
    [c]. *)

(* val to_char: char -> char -> char *)
(** [to_char x y] is the character correspondong to the [xy]
    hexadecimal encoding. *)

(** {1:string Strings} *)

val of_string: ?ignore:char list -> string -> t
(** [of_string s] is the hexadecimal representation of the binary
    string [s]. If [ignore] is set, skip the characters in the list
    when converting. E.g. [of_string ~ignore:[' '] "Mirage OS"] is
    [`Hex "4d69726167654f53"], [of_string "Mirage OS"] is
    [`Hex "4d6972616765204f53"] (with a "20" before the "OS" ("4f53")).
    The default value of [ignore] is [[]]).

    If you have a hex string as input (i.e. "4f53"), you can use
    [to_string (`Hex "4f53")] to decode it to a binary string ("OS"). *)

val to_string: t -> string
(** [to_string t] is the binary string [s] such that [of_string s] is
    [t]. *)
