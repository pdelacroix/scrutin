(* Auto-generated from "test.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type recurse = Test_t.recurse = { recurse_items: recurse list }

type rec_option = Test_t.rec_option

type rec_list = Test_t.rec_list

type mutual_recurse1 = Test_t.mutual_recurse1 = {
  mutual_recurse2: mutual_recurse2 list
}

and mutual_recurse2 = Test_t.mutual_recurse2 = {
  mutual_recurse1: mutual_recurse1 list
}

type container = Test_t.container = { id: string; children: container list }

type vp = Test_t.vp

type vpl = Test_t.vpl

type v = Test_t.v =  A of int | B of string 

type vl = Test_t.vl

type t = Test_t.t

type myInt = Test_t.myInt

type ro = Test_t.ro = { c: string; o: myInt option }

type r = Test_t.r = { a: int; b: string }

type optional_field = Test_t.optional_field = {
  with_default: int;
  no_default: int option;
  no_default_nullable: int option
}

type n = Test_t.n

type an_array = Test_t.an_array

type deeply_nested = Test_t.deeply_nested

type b = Test_t.b = { thing: int }

type adapted_scalar = Test_t.adapted_scalar

type adapted_list = Test_t.adapted_list

type a = Test_t.a = { thing: string; other_thing: bool }

type adapted_kind = Test_t.adapted_kind

type adapted = Test_t.adapted

val read_recurse :  recurse Atdgen_codec_runtime.Decode.t

val write_recurse :  recurse Atdgen_codec_runtime.Encode.t

val read_rec_option :  rec_option Atdgen_codec_runtime.Decode.t

val write_rec_option :  rec_option Atdgen_codec_runtime.Encode.t

val read_rec_list :  rec_list Atdgen_codec_runtime.Decode.t

val write_rec_list :  rec_list Atdgen_codec_runtime.Encode.t

val read_mutual_recurse1 :  mutual_recurse1 Atdgen_codec_runtime.Decode.t

val write_mutual_recurse1 :  mutual_recurse1 Atdgen_codec_runtime.Encode.t

val read_mutual_recurse2 :  mutual_recurse2 Atdgen_codec_runtime.Decode.t

val write_mutual_recurse2 :  mutual_recurse2 Atdgen_codec_runtime.Encode.t

val read_container :  container Atdgen_codec_runtime.Decode.t

val write_container :  container Atdgen_codec_runtime.Encode.t

val read_vp :  vp Atdgen_codec_runtime.Decode.t

val write_vp :  vp Atdgen_codec_runtime.Encode.t

val read_vpl :  vpl Atdgen_codec_runtime.Decode.t

val write_vpl :  vpl Atdgen_codec_runtime.Encode.t

val read_v :  v Atdgen_codec_runtime.Decode.t

val write_v :  v Atdgen_codec_runtime.Encode.t

val read_vl :  vl Atdgen_codec_runtime.Decode.t

val write_vl :  vl Atdgen_codec_runtime.Encode.t

val read_t :  t Atdgen_codec_runtime.Decode.t

val write_t :  t Atdgen_codec_runtime.Encode.t

val read_myInt :  myInt Atdgen_codec_runtime.Decode.t

val write_myInt :  myInt Atdgen_codec_runtime.Encode.t

val read_ro :  ro Atdgen_codec_runtime.Decode.t

val write_ro :  ro Atdgen_codec_runtime.Encode.t

val read_r :  r Atdgen_codec_runtime.Decode.t

val write_r :  r Atdgen_codec_runtime.Encode.t

val read_optional_field :  optional_field Atdgen_codec_runtime.Decode.t

val write_optional_field :  optional_field Atdgen_codec_runtime.Encode.t

val read_n :  n Atdgen_codec_runtime.Decode.t

val write_n :  n Atdgen_codec_runtime.Encode.t

val read_an_array :  an_array Atdgen_codec_runtime.Decode.t

val write_an_array :  an_array Atdgen_codec_runtime.Encode.t

val read_deeply_nested :  deeply_nested Atdgen_codec_runtime.Decode.t

val write_deeply_nested :  deeply_nested Atdgen_codec_runtime.Encode.t

val read_b :  b Atdgen_codec_runtime.Decode.t

val write_b :  b Atdgen_codec_runtime.Encode.t

val read_adapted_scalar :  adapted_scalar Atdgen_codec_runtime.Decode.t

val write_adapted_scalar :  adapted_scalar Atdgen_codec_runtime.Encode.t

val read_adapted_list :  adapted_list Atdgen_codec_runtime.Decode.t

val write_adapted_list :  adapted_list Atdgen_codec_runtime.Encode.t

val read_a :  a Atdgen_codec_runtime.Decode.t

val write_a :  a Atdgen_codec_runtime.Encode.t

val read_adapted_kind :  adapted_kind Atdgen_codec_runtime.Decode.t

val write_adapted_kind :  adapted_kind Atdgen_codec_runtime.Encode.t

val read_adapted :  adapted Atdgen_codec_runtime.Decode.t

val write_adapted :  adapted Atdgen_codec_runtime.Encode.t

