open ReactNative
open! Paper

type choice_t = ElectionBooth_ChoiceSelect.choice_t

@react.component
let make = () => {
  let (state, dispatch) = State.useContexts()
  let (token, setToken) = React.useState(_ => state.ballot.token)
  let (choice : choice_t, setChoice) = React.useState(_ => ElectionBooth_ChoiceSelect.Blank)

  let vote = _ => {
    let selectionArray =
      Array.length(state.election.choices)
      -> Array.make(0)
      -> Array.mapWithIndex((i, _) => choice == Choice(i) ? 1 : 0)

    dispatch(BallotCreate(token, selectionArray))
  }

  <View>
    <Title style=X.styles["title"]>
      {state.election.name -> React.string}
    </Title>
    <View style=X.styles["separator"] />
    <ElectionBooth_ChoiceSelect currentChoice=choice onChoiceChange={choice => setChoice(_ => choice)} />
    <TextInput
      mode=#flat
      label="Token"
      value=token
      onChangeText={text => setToken(_ => Js.String.trim(text))}
    />
    <View style=X.styles["row"]>
      <View style=X.styles["col"]>
        <Button onPress=vote>
          {"Vote" -> React.string}
        </Button>
      </View>
      <View style=X.styles["col"]>
        <Button onPress={_ => dispatch(Action.Navigate(Route.ElectionShow(state.election.id)))}>
          {"Statistiques" -> React.string}
        </Button>
      </View>
    </View>
	</View>
}