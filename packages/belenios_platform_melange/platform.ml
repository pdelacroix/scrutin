module Json = Atdgen_runtime.Util.Json

type 'a shape =
  [ `Atomic of 'a
  | `Array of 'a shape array
  ]

external json_string : string -> Js.Json.t = "%identity"

type 'a reader = 'a Json.reader
type 'a writer = 'a Json.writer

let debug x = Js.log x

let sread of_string json =
  match Js.Json.classify json with
  | Js.Json.JSONString s -> of_string s
  | _ -> failwith "read_string"

let swrite to_string x =
  json_string (to_string x)
  (* Json.Encode.string (to_string x) *)

let rec read_shape read json =
  match Js.Json.classify json with
  | Js.Json.JSONArray a -> `Array (Atdgen_codec_decode.array (read_shape read) json)
  | _ -> `Atomic (read json)

let rec write_shape write = function
  | `Atomic x -> write x
  | `Array xs -> Atdgen_codec_encode.array (write_shape write) xs

module Sjcl = struct

  type bits

  type codec =
    < fromBits : bits -> string [@bs.meth]
    ; toBits : string -> bits [@bs.meth]
    > Js.t

  type codecs =
    < hex : codec
    ; utf8String : codec
    ; base64 : codec
    > Js.t

  type hash =
    < hash : string -> bits [@bs.meth] > Js.t

  type hashes =
    < sha256 : hash > Js.t

  type cipher =
    < encrypt : bits -> bits [@bs.meth]
    > Js.t

  type ciphers =
    < aes : bits -> cipher [@bs.meth]
    > Js.t
 (* [@bs.new] *)
  type mode =
    < encrypt : cipher -> bits -> bits -> bits [@bs.meth]
    ; decrypt : cipher -> bits -> bits -> bits [@bs.meth]
    > Js.t

  type modes =
    <
      ccm : mode
    > Js.t

  type random =
    <
      randomWords : int -> bits [@bs.meth]
    > Js.t

  type misc =
    < pbkdf2 : string -> bits -> int -> int -> bits [@bs.meth] > Js.t

  type sjcl =
    < codec : codecs
    ; hash : hashes
    ; cipher : ciphers
    ; mode : modes
    ; random : random
    ; misc : misc
    > Js.t

  external sjcl : sjcl = "sjcl-with-all" [@@bs.module]
  (* external *)

  let hex = sjcl##codec##hex
  let utf8String = sjcl##codec##utf8String
  let sha256 = sjcl##hash##sha256
  (* let aes = sjcl##cipher##aes *)
  let cipher = sjcl##cipher
  let ccm = sjcl##mode##ccm
end

let hex_fromBits x =
  Sjcl.hex##fromBits x

let hex_toBits x =
  Sjcl.hex##toBits x

let utf8String_fromBits x =
  Sjcl.utf8String##fromBits x

let utf8String_toBits x =
  Sjcl.utf8String##toBits x

let sha256 x =
  Sjcl.sha256##hash x

let sha256_hex x =
  hex_fromBits (sha256 x)

let pbkdf2_generic toBits ~iterations ~salt x =
  let salt = toBits salt in
  let derived = Sjcl.sjcl##misc##pbkdf2 x salt iterations 256 in
  hex_fromBits derived

let pbkdf2_utf8 = pbkdf2_generic utf8String_toBits

let aes_hex ~key ~data =
  let key = hex_toBits key in
  let data = hex_toBits data in
  let cipher = Sjcl.cipher##aes key in
  let output = cipher##encrypt data in
  hex_fromBits output

let encrypt ~key ~iv ~plaintext =
  let key = hex_toBits key in
  let iv = hex_toBits iv in
  let plaintext = utf8String_toBits plaintext in
  let prf = Sjcl.cipher##aes key in
  let ciphertext = Sjcl.ccm##encrypt prf plaintext iv in
  hex_fromBits ciphertext

let decrypt ~key ~iv ~ciphertext =
  let key = hex_toBits key in
  let iv = hex_toBits iv in
  let ciphertext = hex_toBits ciphertext in
  let prf = Sjcl.cipher##aes key in
  let plaintext = Sjcl.ccm##decrypt prf ciphertext iv in
  utf8String_fromBits plaintext

type rng = unit

let secure_rng = ()
let pseudo_rng _ = ()

let string_of_hex hex n =
  String.init n (fun i ->
    let c = int_of_string ("0x" ^ String.sub hex (2*i) 2) in
    char_of_int c
  )

let random_string () n =
  let words = Sjcl.sjcl##random##randomWords (n/4+1) in
  let hex_words = hex_fromBits words in
  string_of_hex hex_words n

module BigIntCompat = struct
  open Js
  type bigint

  type lib =
    < _ZERO : bigint
    ; _ONE : bigint
    ; ofInt : int -> bigint [@bs.meth]
    ; ofString : string t -> bigint [@bs.meth]
    ; ofHex : string t -> bigint [@bs.meth]
    ; add : bigint -> bigint -> bigint [@bs.meth]
    ; subtract : bigint -> bigint -> bigint [@bs.meth]
    ; multiply : bigint -> bigint -> bigint [@bs.meth]
    ; divide : bigint -> bigint -> bigint [@bs.meth]
    ; _mod : bigint -> bigint -> bigint [@bs.meth]
    ; toInt : bigint -> int [@bs.meth]
    ; toString : bigint -> string t [@bs.meth]
    ; toHex : bigint -> string t [@bs.meth]
    ; compare : bigint -> bigint -> int [@bs.meth]
    ; modPow : bigint -> bigint -> bigint -> bigint [@bs.meth]
    ; modInverse : bigint -> bigint -> bigint [@bs.meth]
    ; bitLength : bigint -> int [@bs.meth]
    ; isProbablePrime : bigint -> int -> int [@bs.meth]
    ; shiftLeft : bigint -> int -> bigint [@bs.meth]
    ; shiftRight : bigint -> int -> bigint [@bs.meth]
    ; _and : bigint -> bigint -> bigint [@bs.meth]
    ; _or : bigint -> bigint -> bigint [@bs.meth]
    ; xor : bigint -> bigint -> bigint [@bs.meth]
    > Js.t

  external lib : lib = "BigIntCompat" [@@bs.val][@@bs.module "./BigIntCompat"]
end

module Z = struct
  open BigIntCompat
  type t = bigint

  let zero = lib##_ZERO
  let one = lib##_ONE

  let of_hex x = lib##ofHex x
  let of_string x = lib##ofString x
  let of_int x = lib##ofInt x
  let ( + ) x y = lib##add x y
  let ( - ) x y = lib##subtract x y
  let ( * ) x y = lib##multiply x y
  let ( / ) x y = lib##divide x y
  let ( mod ) x y = lib##_mod x y

  let to_int x = lib##toInt x
  let to_string x = lib##toString x
  let to_hex x = lib##toHex x
  let compare x y = lib##compare x y
  let ( =% ) x y = compare x y = 0
  let powm x y m = lib##modPow x y m
  let invert x m = lib##modInverse x m
  let bit_length x = lib##bitLength x

  let erem x y =
    let r = x mod y in
    if compare r zero < 0 then r + y else r

  let probab_prime x n = lib##isProbablePrime x n

  let z256 = of_int 256

  let of_bits x =
    let n = String.length x in
    let rec loop res i =
      if i >= 0
      then loop (res * z256 + of_int (int_of_char x.[i])) (pred i)
      else res
    in loop zero (pred n)

  let shift_left x n = lib##shiftLeft x n
  let shift_right x n = lib##shiftRight x n
  let logand x y = lib##_and x y
  let logor x y = lib##_or x y
  let logxor x y = lib##xor x y

  let hash_modulus = of_int 1073741789 (* previous_prime(2^30) *)
  let hash_to_int x = to_int (erem x hash_modulus)
end

type int_array
external int_array_create : int -> int_array = "Int32Array" [@@bs.new]
external int_array_get : int_array -> int -> int = "" [@@bs.get_index]
external int_array_set : int_array -> int -> int -> unit = "" [@@bs.set_index]

type libsodium =
  < bytes : unit -> int [@bs.meth]
  ; scalarbytes : unit -> int [@bs.meth]
  ; is_valid_point_ : int -> int [@bs.meth]
  ; scalarmult : int -> int -> int -> int [@bs.meth]
  ; add : int -> int -> int -> int [@bs.meth]
  ; base : int
  ; buffer : int_array
  > Js.t

let build_libsodium_stubs (libsodium : libsodium Js.t) =
  let module X : Signatures.LIBSODIUM_STUBS =
    struct
      type scalar = bytes
      type point = bytes
      let bytes () = libsodium##bytes ()
      let scalarbytes () = libsodium##scalarbytes ()

      let base = libsodium##base
      let buffer = libsodium##buffer
      let nbytes = bytes ()
      let nscalarbytes = scalarbytes ()

      let copy_to_wasm address x length =
        for i = 0 to length - 1 do
          int_array_set buffer (address + i) (int_of_char (Bytes.get x i))
        done

      let copy_from_wasm x address length =
        for i = 0 to length - 1 do
          Bytes.set x i (char_of_int (int_array_get buffer (address + i)))
        done

      let is_valid_point p =
        copy_to_wasm base p nbytes;
        libsodium##is_valid_point_ base

      let reg1 = base + nbytes
      let reg2 = reg1 + nscalarbytes

      let scalarmult q n p =
        copy_to_wasm reg1 n nscalarbytes;
        copy_to_wasm reg2 p nbytes;
        let r = libsodium##scalarmult base reg1 reg2 in
        copy_from_wasm q base nbytes;
        r

      let reg3 = reg1 + nbytes

      let add r p q =
        copy_to_wasm reg1 p nbytes;
        copy_to_wasm reg3 q nbytes;
        let result = libsodium##add base reg1 reg3 in
        copy_from_wasm r base nbytes;
        result
    end
  in
  (module X : Signatures.LIBSODIUM_STUBS)

let libsodium_ref = ref None

let libsodium_stubs () =
  match !libsodium_ref with
  | None ->
      None
     (* Js.Undefined.iter [%bs.raw {|belenios.libsodium|}] *)
     (*   (fun [@bs] x -> libsodium_ref := Some (build_libsodium_stubs x)); *)
     (* !libsodium_ref *)
  | x -> x
