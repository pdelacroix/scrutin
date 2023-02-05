open! Paper;

@react.component
let make = (~index, ~voter: Voter.t) => {
  let (_, dispatch) = Context.use()

  <List.Item
    title=voter.email
    left={_ => <List.Icon icon=Icon.name("account") />}
    onPress={_ => ()}
    right={_ =>
      <Button onPress={_ => dispatch(Action.Election_RemoveVoter(index))}>
        <List.Icon icon=Icon.name("delete") />
      </Button>
    }
  />
}