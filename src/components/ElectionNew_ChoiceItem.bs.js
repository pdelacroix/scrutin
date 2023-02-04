// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "../state/State.bs.js";
import * as React from "react";
import * as ReactNativePaper from "react-native-paper";

function ElectionNew_ChoiceItem(Props) {
  var index = Props.index;
  var choice = Props.choice;
  var match = State.useContexts(undefined);
  var dispatch = match[1];
  return React.createElement(ReactNativePaper.List.Item, {
              onPress: (function (param) {
                  
                }),
              title: choice.name,
              left: (function (param) {
                  return React.createElement(ReactNativePaper.List.Icon, {
                              icon: "vote"
                            });
                }),
              right: (function (param) {
                  return React.createElement(ReactNativePaper.Button, {
                              onPress: (function (param) {
                                  Curry._1(dispatch, {
                                        TAG: /* RemoveChoice */7,
                                        _0: index
                                      });
                                }),
                              children: React.createElement(ReactNativePaper.List.Icon, {
                                    icon: "delete"
                                  })
                            });
                })
            });
}

var make = ElectionNew_ChoiceItem;

export {
  make ,
}
/* State Not a pure module */
