// Generated by ReScript, PLEASE EDIT WITH CARE

import * as X from "../helpers/X.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Context from "../Context.bs.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_MapString from "rescript/lib/es6/belt_MapString.js";
import * as ReactNativePaper from "react-native-paper";

function Home_Elections$Election(Props) {
  var eventHash = Props.eventHash;
  var election = Props.election;
  var match = Context.use(undefined);
  var dispatch = match[1];
  var electionParams = JSON.parse(election.params);
  var show = function (param) {
    Curry._1(dispatch, {
          TAG: /* Navigate */0,
          _0: {
            TAG: /* Election_Show */0,
            _0: eventHash
          }
        });
  };
  return React.createElement(ReactNativePaper.Card, {
              children: null
            }, React.createElement(ReactNativePaper.Card.Content, {
                  children: React.createElement(ReactNativePaper.List.Section, {
                        title: "Election en cours",
                        children: null
                      }, React.createElement(ReactNativePaper.List.Item, {
                            title: "Name",
                            description: electionParams.name
                          }), React.createElement(ReactNativePaper.List.Item, {
                            title: "Description",
                            description: electionParams.description
                          }))
                }), React.createElement(ReactNativePaper.Card.Actions, {
                  children: React.createElement(ReactNativePaper.Button, {
                        mode: "contained",
                        onPress: show,
                        children: "Go"
                      })
                }));
}

var Election = {
  make: Home_Elections$Election
};

function Home_Elections(Props) {
  var match = Context.use(undefined);
  var dispatch = match[1];
  return React.createElement(React.Fragment, undefined, React.createElement(X.Title.make, {
                  children: "-"
                }), React.createElement(ReactNativePaper.Button, {
                  mode: "contained",
                  onPress: (function (param) {
                      Curry._1(dispatch, {
                            TAG: /* Navigate */0,
                            _0: /* Election_New */4
                          });
                    }),
                  children: "Creer une nouvelle election"
                }), React.createElement(X.Title.make, {
                  children: "-"
                }), Belt_Array.map(Belt_MapString.toArray(match[0].cache.elections), (function (param) {
                    var eventHash = param[0];
                    return React.createElement(Home_Elections$Election, {
                                eventHash: eventHash,
                                election: param[1],
                                key: eventHash
                              });
                  })), React.createElement(X.Title.make, {
                  children: "-"
                }));
}

var make = Home_Elections;

export {
  Election ,
  make ,
}
/* X Not a pure module */
