open ReactNative

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
    )
  })
}

@react.component
let make = () => {
  let (state, dispatch) = State.useContextReducer()

	let (email, setEmail) = React.useState(_ => "")

	let addVoter = _ => {
		dispatch(AddVoter(email))
		setEmail(_ => "")
	}

	<View>
    <View>
      {
        state.election.voters
        -> Js.Array2.map(voter => {
          <VoterItem voter=voter key=voter.email />
        })
        -> React.array
      }
    </View>
    <View style=styles["row"]>
      <View style=styles["col"]>
		    <TextInput value={email} onChangeText={txt => setEmail(_ => txt)} placeholder="Email" />
      </View>
      <View style=styles["col"]>
        //<View style=styles["smallButton"]>
          <Button onPress={_ => addVoter()} title="Ajouter"></Button>
        //</View>
      </View>
    </View>
	</View>
}

/*
open Helper
open ReactNative
open Paper

@react.component
let make = (~state: State.state, ~dispatch: Action.t => unit) => {
	let (email, setEmail) = React.useState(_ => "")

	let addVoter = _ => {
		dispatch(AddVoter(email))
		setEmail(_ => "")
	}

  let onChange = (event) =>
    setEmail(ReactEvent.Form.currentTarget(event)["value"])

	let onPress = _ => addVoter()

	<View>
    <List.Section title="Votants">
      {
        state.election.voters
        -> Js.Array2.map(voter => {
          <Voter name=voter.name key=voter.name dispatch />
        })
        -> React.array
      }
    </List.Section>
    <View>
		  <TextInput mode=#flat value={email} onChangeText={txt => setEmail(_ => txt)} />
		  <Button onPress>{rs("Ajouter")}</Button>
    </View>
	</View>
}
*/