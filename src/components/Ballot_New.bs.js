// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Core from "../Core.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Context from "../Context.bs.js";
import * as Belenios from "../helpers/Belenios.bs.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_MapString from "rescript/lib/es6/belt_MapString.js";
import * as ReactNativePaper from "react-native-paper";

function Ballot_New$Choice(Props) {
  var name = Props.name;
  var selected = Props.selected;
  var onSelect = Props.onSelect;
  var iconName = selected ? "radiobox-marked" : "radiobox-blank";
  return React.createElement(ReactNativePaper.List.Item, {
              onPress: (function (param) {
                  Curry._1(onSelect, undefined);
                }),
              title: name,
              left: (function (param) {
                  return React.createElement(ReactNativePaper.List.Icon, {
                              icon: iconName
                            });
                })
            });
}

var Choice = {
  make: Ballot_New$Choice
};

function Ballot_New(Props) {
  var ballotTx = Props.ballotTx;
  var match = Context.use(undefined);
  var dispatch = match[1];
  var state = match[0];
  var ballot = Belt_MapString.getExn(state.cached_ballots, ballotTx);
  var election = Belt_MapString.getExn(state.cached_elections, ballot.electionTx);
  var answers = Belenios.Election.answers(JSON.parse(election.params));
  var nbChoices = answers.length;
  var match$1 = React.useState(function () {
        
      });
  var setChoice = match$1[1];
  var choice = match$1[0];
  return React.createElement(React.Fragment, undefined, React.createElement(ReactNativePaper.List.Section, {
                  title: "Choices",
                  children: Belt_Array.mapWithIndex(answers, (function (i, choiceName) {
                          var selected = Caml_obj.equal(choice, i);
                          return React.createElement(Ballot_New$Choice, {
                                      name: choiceName,
                                      selected: selected,
                                      onSelect: (function (param) {
                                          Curry._1(setChoice, (function (param) {
                                                  return i;
                                                }));
                                        }),
                                      key: String(i)
                                    });
                        }))
                }), React.createElement(ReactNativePaper.Button, {
                  mode: "contained",
                  onPress: (function (param) {
                      Core.Ballot.vote(ballot, choice, nbChoices, state, dispatch);
                    }),
                  children: "Voter"
                }));
}

var make = Ballot_New;

export {
  Choice ,
  make ,
}
/* Core Not a pure module */
