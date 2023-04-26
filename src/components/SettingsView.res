@react.component
let make = () => {
  let (_state, dispatch) = StateContext.use()
  let {t, i18n} = ReactI18next.useTranslation()

  let language = switch i18n.language {
  | "en-US" => "en"
  | language => language
  }

  <>
    <Header />
    <Paper.List.Section title={t(. "settings.language")} style=S.marginX>
      <S.SegmentedButtons
        value=language
        buttons=[
          {value: "en", label: "English"},
          {value: "fr", label: "Français"},
          {value: "nb_NO", label: "Norsk"},
        ]
        onValueChange={lang => {
          i18n.changeLanguage(. lang)
          dispatch(Config_Store_Language(lang))
        }}
      />
    </Paper.List.Section>
    <Paper.List.Section title={t(. "settings.internals")} style=S.marginX>
      <Paper.List.Item
        title={t(. "settings.identities")} onPress={_ => dispatch(Navigate(list{"identities"}))}
      />
      <Paper.List.Item
        title={t(. "settings.trustees")} onPress={_ => dispatch(Navigate(list{"trustees"}))}
      />
      <Paper.List.Item
        title={t(. "settings.contacts")} onPress={_ => dispatch(Navigate(list{"contacts"}))}
      />
      <Paper.List.Item title={t(. "settings.events")} onPress={_ => dispatch(Navigate(list{"events"}))} />
    </Paper.List.Section>
  </>
}
