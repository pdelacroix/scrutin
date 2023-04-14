@react.component
let make = () => {
  let (_state, dispatch) = Context.use()
  let { t } = ReactI18next.useTranslation()

  <View>
    <Header />

    <Logo />

    <S.Button title=t(."home.create")
      onPress={_ => dispatch(Navigate(list{"elections", "new"}))} />

    <Button mode=#text onPress={_ => dispatch(Navigate(list{"elections"}))}>
      { t(."home.search") -> React.string }
    </Button>

    <HomeBackground />
  </View>
}

