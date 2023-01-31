open ReactNative
open! Paper

module ElectionLink = {
  @react.component
  let make = (~election : Election.t) => {
    let (_, dispatch) = State.useContexts()

    <List.Item
      title=election.name
      left={_ => <List.Icon icon=Icon.name("vote") />}
      onPress={_ => dispatch(Action.Navigate(Route.ElectionShow(election.id)))}
    />
  }
}

@react.component
let make = () => {
  let (state, _dispatch) = State.useContexts()

  if state.elections_loading {
    <ActivityIndicator />
  } else {
    <List.Section title="Elections en cours" style=X.styles["margin-x"]>
      {
        Array.map(state.elections, (election) => {
          <ElectionLink election />
        })
        -> React.array
      }
    </List.Section>
  }
}