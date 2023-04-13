type t = {
  left: option<float>,
  right: option<float>,
  top: option<float>,
  bottom: option<float>,
}

// hitSlop prop accept number and edge inset object
@obj
external // @deprecated("Directly create record instead")
rect: (~left: float=?, ~right: float=?, ~top: float=?, ~bottom: float=?, unit) => t = ""

external float: float => t = "%identity"
