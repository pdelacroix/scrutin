let post = (url, json) => {
  let headers = {
    "Content-Type": "application/json"
  }
  -> Webapi.Fetch.HeadersInit.make

  let body = json
  -> Js.Json.stringify
  -> Webapi.Fetch.BodyInit.make

  Webapi.Fetch.fetchWithInit(
    url,
    Webapi.Fetch.RequestInit.make(~method_=Post, ~body, ~headers, ()),
  )
}

let styles = {
  open Style

  StyleSheet.create({
    "row": viewStyle(
      ~flexDirection=#row,
      ~padding=10.0->dp,
      ()
    ),
    "col": viewStyle(
      ~flex=1.0,
      ~padding=5.0->dp,
      ()
    ),

    "smallButton": textStyle(
      ~height=15.0->dp,
      ()
    ),

    "margin-x": viewStyle(
      ~marginLeft=15.0->dp,
      ~marginRight=15.0->dp,
      ()
    ),

    "pad-left": viewStyle(
      ~marginLeft=40.0->dp,
      ()
    ),

    "margin-y-8": viewStyle(
      ~marginTop=8.0->dp,
      ~marginBottom=8.0->dp,
      ()
    ),

    "modal": textStyle(
      ~padding=10.0->dp,
      ~margin=10.0->dp,
      ~backgroundColor=Color.white,
      ()
    ),
    "layout": {
      if ReactNative.Platform.os == #web && Dimension.width() > 800 {
        viewStyle(
          ~width=800.0->dp,
          ~alignSelf=#center,
          ~borderColor=Color.rgb(~r=103, ~g=80, ~b=164),
          ~borderWidth=3.0,
          ~borderRadius=40.0,
          ~height=100.0->pct,
          ()
        )
      } else { viewStyle() }
    },
    "center": viewStyle(~alignSelf=#center, ()),

    "green": textStyle(~color=Color.green, ()),
    "red": textStyle(~color=Color.red, ()),
  })
}


module SegmentedButtons = {
  type button = {
    value: string,
    label: string
  }
  @module("react-native-paper") @react.component
  external make: (
    ~value: string,
    ~onValueChange: (string) => (),
    ~buttons: array<button>,
    ~theme: Paper__ThemeProvider.Theme.t=?,
    ~style: ReactNative.Style.t=?,
    // density
  ) => React.element = "SegmentedButtons"
}

module Title = {
  @react.component
  let make = (~children) => {
    <Title style=S.title>
      {children}
    </Title>
  }
}

// Forms
let ev = (event) => ReactEvent.Form.target(event)["value"] 
let prevent = (f) =>
  (e) => {
    ReactEvent.Synthetic.preventDefault(e)
    f(e)
  }
let isKeyEnter : ('a => bool) = %raw(`function(key) { return key.key == "Enter" }`)

@val external nodeEnv: string = "process.env.NODE_ENV"

let env = switch nodeEnv {
| "production" => #prod
| "development" => #dev
| _ => #dev
}
