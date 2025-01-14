@react.component
let make = (~election: Election.t, ~electionId) => {
  let (state, dispatch) = StateContext.use()

  // ballots we have an invitation for
  let ballots =
    state.ballots
    ->Array.keep((ballot) => ballot.electionId == electionId)
    ->Array.keep((ballot) =>
      Array.some(state.accounts, id => {
        id.userId == ballot.voterId
      })
    )

  let nbVotes = state
    ->State.getElectionValidBallots(electionId)
    ->Array.length

  let styles = {
    open Style
    StyleSheet.create({
      "choiceEditButton": viewStyle(
        ~position=#absolute,
        ~top=0.0->dp,
        ~right=0.0->dp,
        ~width=100.0->dp,
        ~backgroundColor=S.primaryColor,
        (),
      )
    })
  }

  <>
    <ElectionHeader election />
    <View>
      <ElectionShowChoices election />
      {switch ballots {
      | [] => <></>
      | _ =>
        <IconButton
          icon={Icon.name("square-edit-outline")}
          style={styles["choiceEditButton"]}
          onPress={_ => {
            ()
            //let (ballotId, _ballot) = hd
            //dispatch(Navigate(list{"ballots", ballotId}))
          }}
        />
      }}
    </View>
    <View style={Style.viewStyle(~marginTop=-30.0->Style.dp, ())}>
      <View style={Style.viewStyle(~position=#absolute, ~right=30.0->Style.dp, ())}>
        <Text
          style={Style.textStyle(
            ~width=switch ReactNative.Platform.os {
            | #web => 80.0->Style.dp
            | _ => 120.0->Style.dp
            },
            ~backgroundColor=S.primaryColor,
            ~color=Color.white,
            ~paddingBottom=5.0->Style.dp,
            ~paddingLeft=8.0->Style.dp,
            (),
          )}>
          {"Vote privé"->React.string}
        </Text>
      </View>
    </View>

    { switch ReactNative.Platform.os {
    | #web => <></>
    | _ => <View style={Style.viewStyle(~height=30.0->Style.dp, ())} />
    } }

    {switch election.result {
    | Some(_) =>
      <S.Button
        title="Afficher le résultat"
        onPress={_ => dispatch(Navigate(list{"elections", electionId, "result"}))}
      />
    | None =>
      switch Array.getBy(state.accounts, (account) => {
        Array.getBy(election.adminIds, userId => userId == account.userId)->Option.isSome
      }) {
      | None => <> </>
      | Some(_adminAccount) =>
        <>
          <S.Button
            title="Ajouter des votants"
            onPress={_ => dispatch(Navigate(list{"elections", electionId, "invite"}))}
          /> // TODO: i18n
          //<Button mode=#text onPress={_ =>
          //  dispatch(Navigate(list{"elections", electionId, "invite"}))
          //}>
          //  { "Gérer les invitations" -> React.string }
          //</Button>

          //<Divider />

          <S.Button
            title={`Calculer le résultat des ${nbVotes->Int.toString} votes`}
            onPress={_ => Core.Election.tally(~electionId)(state, dispatch)}
          />
        </>
      }
    }}
  </>
}
