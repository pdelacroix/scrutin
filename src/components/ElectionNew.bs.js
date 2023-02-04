// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "../state/State.bs.js";
import * as React from "react";
import * as ReactNative from "react-native";
import * as ReactNativePaper from "react-native-paper";
import * as ElectionNew_VoterList from "./ElectionNew_VoterList.bs.js";
import * as ElectionNew_ChoiceList from "./ElectionNew_ChoiceList.bs.js";

function ElectionNew(Props) {
  var match = State.useContexts(undefined);
  var dispatch = match[1];
  var state = match[0];
  var match$1 = React.useState(function () {
        return false;
      });
  var setVisibleVoter = match$1[1];
  var match$2 = React.useState(function () {
        return false;
      });
  var setVisibleChoice = match$2[1];
  var onSubmit = function (param) {
    if (state.election.choices.length < 2) {
      return Curry._1(setVisibleChoice, (function (param) {
                    return true;
                  }));
    } else if (state.election.voters.length < 1) {
      return Curry._1(setVisibleVoter, (function (param) {
                    return true;
                  }));
    } else {
      return Curry._1(dispatch, /* PostElection */1);
    }
  };
  return React.createElement(ReactNative.View, {
              children: null
            }, React.createElement(ReactNativePaper.TextInput, {
                  mode: "flat",
                  label: "Nom de l'élection",
                  value: state.election.name,
                  onChangeText: (function (text) {
                      Curry._1(dispatch, {
                            TAG: /* SetElectionName */2,
                            _0: text
                          });
                    })
                }), React.createElement(ElectionNew_ChoiceList.make, {}), React.createElement(ElectionNew_VoterList.make, {}), React.createElement(ReactNativePaper.Button, {
                  mode: "contained",
                  onPress: onSubmit,
                  children: React.createElement(ReactNativePaper.Text, {
                        children: "Create election"
                      })
                }), React.createElement(ReactNativePaper.Portal, {
                  children: null
                }, React.createElement(ReactNativePaper.Snackbar, {
                      onDismiss: (function (param) {
                          Curry._1(setVisibleChoice, (function (param) {
                                  return false;
                                }));
                        }),
                      visible: match$2[0],
                      children: "You should have at least 2 choices"
                    }), React.createElement(ReactNativePaper.Snackbar, {
                      onDismiss: (function (param) {
                          Curry._1(setVisibleVoter, (function (param) {
                                  return false;
                                }));
                        }),
                      visible: match$1[0],
                      children: "You should have at least 1 voter"
                    })));
}

var make = ElectionNew;

export {
  make ,
}
/* State Not a pure module */
