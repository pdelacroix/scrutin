@react.component
let make = () => {
  let (state, dispatch) = StateContext.use()
  let {t} = ReactI18next.useTranslation()

  <>
    <S.Title> {t(. "invitation.title")->React.string} </S.Title>
    <Paper.List.Section title="" style=S.marginX>
      {Array.mapWithIndex(state.invitations, (i, invitation) => {
        <Card key=invitation.userId>
          <Card.Content>
            <Paper.List.Item
              title={t(. "invitation.item.email")}
              description={Option.getWithDefault(invitation.email, "")}
            />
            <Paper.List.Item
              title={t(. "invitation.item.phoneNumber")}
              description={Option.getWithDefault(invitation.phoneNumber, "")}
            />
            <Paper.List.Item title={"0x" ++ invitation.userId} />
          </Card.Content>
          <Card.Actions>
            <Paper.Button mode=#contained onPress={_ => dispatch(Invitation_Remove(i))}>
              {t(. "invitation.delete")->React.string}
            </Paper.Button>
          </Card.Actions>
        </Card>
      })->React.array}
    </Paper.List.Section>
    <Paper.Button
      mode=#outlined
      onPress={_ => {
        Invitation.clear()
        dispatch(Reset)
      }}>
      {t(. "invitation.clearAll")->React.string}
    </Paper.Button>
    <S.Title> {"-"->React.string} </S.Title>
  </>
}
