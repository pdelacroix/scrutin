module ItemInput = {
  @react.component
  let make = (~name, ~onUpdate) => {
    <TextInput
      mode=#flat
			value=name
      onChangeText=onUpdate
    />
  }
}

module Item = {
  @react.component
  let make = (~onRemove, ~onUpdate, ~name) => {
    <S.Row style=Style.viewStyle(~margin=Style.dp(20.0),())>
      <S.Col style=Style.viewStyle(~flexGrow=10.0,())>
        <ItemInput name onUpdate />
      </S.Col>
      <S.Col>
        <Button onPress=onRemove>
          <List.Icon icon=Icon.name("delete") />
        </Button>
      </S.Col>
    </S.Row>
  }
}

@react.component
let make = (~choices, ~setChoices) => {
  let (name, setName) = React.useState(_ => "")
  let (showModal, setshowModal) = React.useState(_ => false)
  let { t } = ReactI18next.useTranslation()

  let onSubmit = _ => {
    setChoices(choices => Array.concat(choices, [name]))
		setName(_ => "")
    setshowModal(_ => false)
  }

  let onRemove = i => {
    setChoices(choices =>
      Array.keepWithIndex(choices, (_name, index) => index != i)
    )
  }

  let onUpdate = (i, newName) => {
    setChoices(choices =>
      Array.mapWithIndex(choices, (index, oldName) => {
        if (index == i) {
          newName
        } else {
          oldName
        }
      })
    )
  }

  <View testID="choice-list">

    <Title style=S.section>
      { t(."election.new.choiceList.choices") -> React.string }
    </Title>

    <View>
      { Array.mapWithIndex(choices, (i, name) => {
        <Item
          name
          key=Int.toString(i)
          onRemove={_ => onRemove(i)}
          onUpdate={name => onUpdate(i, name)}
        />
      }) -> React.array }
    </View>

    <Button
      style=Style.viewStyle(
        ~alignSelf=#center,
        ~width=50.0->Style.dp,
      ())
      mode=#contained
      onPress={_ => setshowModal(_ => true)}
    >
      <Text
        style=Style.textStyle(
          ~fontSize=30.0,
          ~color=Color.white,
        ())
      >
        { "+" -> React.string }
      </Text>
    </Button>

    <Portal>
      <Modal visible={showModal} onDismiss={_ => setshowModal(_ => false)}>
        <View style=S.flatten([S.modal, S.layout]) testID="choice-modal">
          <TextInput
            mode=#flat
            label=t(."election.new.choiceList.modal.choiceName")
            testID="choice-name"
            autoFocus=true
            value=name
            onChangeText={text => setName(_ => text)}
            onSubmitEditing=onSubmit
          />
          <S.Row>
            <S.Col>
              <Button
                onPress={_ => { setName(_ => ""); setshowModal(_ => false)} }>
                { t(."election.new.choiceList.modal.back") -> React.string }
              </Button>
            </S.Col>
            <S.Col>
              <Button mode=#contained onPress=onSubmit>
                { t(."election.new.choiceList.modal.add") -> React.string }
              </Button>
            </S.Col>
          </S.Row>
        </View>
      </Modal>
    </Portal>
  </View>
}
