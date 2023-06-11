type alphabet
(** Type of alphabet. *)

val decode :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (string, [> `Msg of string ]) result
(** Same as {!decode_exn}, but returns an explicit error message {!result} if it
    fails. *)

val encode :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (string, [> `Msg of string ]) result
(** [encode s] encodes the string [s] into base64. If [pad] is false, no
    trailing padding is added. [pad] defaults to [true], and [alphabet] to
    {!default_alphabet}.

    [encode] fails when [off] and [len] do not designate a valid range of [s]. *)
