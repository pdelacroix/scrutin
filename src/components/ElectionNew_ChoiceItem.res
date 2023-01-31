open ReactNative;

@react.component
let make = (~choice: Choice.t) => {
  let (_, dispatch) = State.useContexts()

  <View style=X.styles["row"]>
    <View style=X.styles["col"]>
    <Text>{choice.name ->  React.string}</Text>
    </View>
    <View style=X.styles["col"]>
      <Button color=Color.rosybrown onPress={_ => dispatch(Action.RemoveChoice(choice.name)) } title="Remove"></Button>
    </View>
  </View>
}