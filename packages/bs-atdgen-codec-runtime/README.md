# bs-atdgen-codec-runtime

`bs-atdgen-codec-runtime` is a bucklescript runtime for
[atdgen](https://github.com/ahrefs/atd). It is based on the json type
provided by bucklescript and combinators of
[@glennsl/bs-json](https://github.com/glennsl/bs-json).

## Installation

```
yarn add @ahrefs/bs-atdgen-codec-runtime
```

This package doesn't take care of running atdgen to derive code from
type definitions. This step requires the `atdgen` binary which can be
obtained using [opam](https://opam.ocaml.org/) or [esy](https://esy.sh/).

Alternatively, if your project is using BuckleScript exclusively (i.e. not using native OCaml or Reason in the backend),
you might consider using [`bs-atdgen-generator`](https://github.com/jchavarri/bs-atdgen-generator) in combination with
this runtime library, in order to generate the `.ml` and `.mli` files from `.atd` sources without having to use native
package managers like `esy` or `opam`.

## Usage

Add `@ahrefs/bs-atdgen-codec-runtime` to the `bs-dependencies` of
`bsconfig.json`.

To write atd type definitions, please have a look at the [great atd
documentation](https://atd.readthedocs.io/en/latest/).

## Simple example

Reason code to query and deserialize the response of a REST API. It
requires `bs-fetch`.

```
let get = (url, decode) =>
  Js.Promise.(
    Fetch.fetchWithInit(
      url,
      Fetch.RequestInit.make(~method_=Get, ()),
    )
    |> then_(Fetch.Response.json)
    |> then_(json => json |> decode |> resolve)
  );

let v: Meetup_t.events =
  get(
    "http://localhost:8000/events",
    Atdgen_codec_runtime.Decode.decode(Meetup_bs.read_events),
  );
```

## Full example

The [example](example) directory contains a full example of a simple
cli to read and write data in a JSON file.

For a complete introduction from atdgen installation to json
manipulation, please refer to [Getting started with atdgen and
bucklescript](https://tech.ahrefs.com/getting-started-with-atdgen-and-bucklescript-1f3a14004081).
