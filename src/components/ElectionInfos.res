@react.component
let make = (~electionId) => {
  let (state, dispatch) = StateContext.use()
  let {t} = ReactI18next.useTranslation()
  let election = Map.String.getExn(state.elections, electionId)
  let (showAdvanced, setShowAdvanced) = React.useState(_ => false)
  let (showBallots, setShowBallots) = React.useState(_ => false)

  let ballots =
    Array.keep(state.ballots, (ballot) => ballot.electionId == electionId)
  let nbBallots = Array.length(ballots)

  <>
    <Paper.Button mode=#outlined onPress={_ => setShowAdvanced(b => !b)}>
      {if showAdvanced {
        t(. "election.show.hideAdvanced")
      } else {
        t(. "election.show.showAdvanced")
      }->React.string}
    </Paper.Button>
    {if showAdvanced {
      <>
        <Paper.List.Item title={t(. "election.show.id")} description=electionId />
        { Array.map(election.adminIds, (userId) => {
          <Paper.List.Item
            title={t(. "election.show.ownerPublicKey")} description=userId
            onPress={_ => dispatch(Navigate(list{"identities", userId})) }
          />
        }) -> React.array }
        <Paper.List.Item title={t(. "election.show.params")} description=election.params />
        <Paper.List.Item title={t(. "election.show.trustees")} description=election.trustees />
      </>
    } else {
      <> </>
    }}
    <Paper.Button mode=#outlined onPress={_ => setShowBallots(b => !b)}>
      {if showBallots {
        t(. "election.show.hideBallots")
      } else {
        t(. "election.show.showBallots")
      }->React.string}
    </Paper.Button>
    {if showBallots {
      <Paper.List.Section title={`${nbBallots->Int.toString} ballots`}>
        {Array.mapWithIndex(ballots, (i, _ballot) => {
          <Paper.List.Item
            title={`Ballot ${i->Int.toString}`}
            key=(i->Int.toString) />
        })->React.array}
      </Paper.List.Section>
    } else {
      <> </>
    }}
  </>
}
