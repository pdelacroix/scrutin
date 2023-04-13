type content = {
  title: option<string>,
  message: option<string>,
  url: option<string>,
}

@obj
external // @deprecated("Directly create record instead")
content: (~title: string=?, ~message: string=?, ~url: string=?, unit) => content = ""

type options = {
  subject: option<string>,
  tintColor: option<string>,
  excludedActivityTypes: option<array<string>>,
  dialogTitle: option<string>,
}

@obj
external // @deprecated("Directly create record instead")
options: (
  ~subject: string=?,
  ~tintColor: string=?,
  ~excludedActivityTypes: array<string>=?,
  ~dialogTitle: string=?,
  unit,
) => options = ""

type action

@module("react-native") @scope("Share")
external sharedAction: action = "sharedAction"

@module("react-native") @scope("Share")
external dismissedAction: action = "dismissedAction"

// This is usually only used as a callback param and not created by the user.
// Therefore prefer option<...> to an optional field for easier matching.
type shareResult = {
  action: action,
  activityType: option<string>,
}

// multiple externals
@module("react-native") @scope("Share")
external share: content => Js.Promise.t<shareResult> = "share"

// multiple externals
@module("react-native") @scope("Share")
external shareWithOptions: (content, options) => Js.Promise.t<bool> = "share"
