type options = {
  options: array<string>,
  cancelButtonIndex: option<int>,
  destructiveButtonIndex: option<array<int>>,
  disabledButtonIndices: option<int>,
  title: option<string>,
  message: option<string>,
  tintColor: option<Color.t>,
  cancelButtonTintColor: option<Color.t>,
}

@obj
external // @deprecated("Directly create record instead")
options: (
  ~options: array<string>,
  ~cancelButtonIndex: int=?,
  ~destructiveButtonIndex: array<int>=?,
  ~disabledButtonIndices: int=?,
  ~title: string=?,
  ~message: string=?,
  ~tintColor: Color.t=?,
  ~cancelButtonTintColor: Color.t=?,
  unit,
) => options = ""

@module("react-native") @scope("ActionSheetIOS")
external showActionSheetWithOptions: (options, int => unit) => unit = "showActionSheetWithOptions"

type shareOptions = {
  url: option<string>,
  message: option<string>,
  subject: option<string>,
  excludedActivityTypes: option<array<string>>,
}

@obj
external // @deprecated("Directly create record instead")
shareOptions: (
  ~url: string=?,
  ~message: string=?,
  ~subject: string=?,
  ~excludedActivityTypes: array<string>=?,
  unit,
) => shareOptions = ""

type error = {stack: option<string>}

@module("react-native") @scope("ActionSheetIOS")
external showShareActionSheetWithOptions: (
  shareOptions,
  error => unit,
  (bool, string) => unit,
) => unit = "showShareActionSheetWithOptions"

@module("react-native") @scope("ActionSheetIOS")
external dismissActionSheet: unit => unit = "dismissActionSheet"
