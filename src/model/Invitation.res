type t = {
  userId: string,
  email?: string,
  phoneNumber?: string
}

// == Serialization
external parse: string => t = "JSON.parse"
external stringify: t => string = "JSON.stringify"
external parse_array: string => array<t> = "JSON.parse"
external stringify_array: array<t> => string = "JSON.stringify"

// == Storage
let storageKey = "invitations"
let loadAll = () =>
  ReactNativeAsyncStorage.getItem(storageKey)
  ->Promise.thenResolve(Js.Null.toOption)
  ->Promise.thenResolve(Option.map(_, parse_array))
  ->Promise.thenResolve(Option.getWithDefault(_, []))
let store_all = txs => ReactNativeAsyncStorage.setItem(storageKey, stringify_array(txs))->ignore
let clear = () => ReactNativeAsyncStorage.removeItem(storageKey)->ignore
