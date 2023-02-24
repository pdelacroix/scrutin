// Generated by ReScript, PLEASE EDIT WITH CARE

import * as X from "./X.bs.js";
import * as Home from "./components/Home.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "./state/State.bs.js";
import * as React from "react";
import * as UseTea from "rescript-use-tea/src/UseTea.bs.js";
import * as Context from "./state/Context.bs.js";
import * as ElectionNew from "./components/ElectionNew.bs.js";
import * as ElectionShow from "./components/ElectionShow.bs.js";
import * as User_Profile from "./components/User_Profile.bs.js";
import * as ReactNative from "react-native";
import * as User_Register from "./components/User_Register.bs.js";
import * as ReactNativePaper from "react-native-paper";
import * as User_Register_Confirm from "./components/User_Register_Confirm.bs.js";

function App(Props) {
  var match = UseTea.useTea(State.reducer, State.initial);
  var dispatch = match[1];
  var state = match[0];
  React.useEffect((function () {
          Curry._1(dispatch, /* Init */0);
        }), []);
  var match$1 = state.route;
  var tmp;
  if (typeof match$1 === "number") {
    switch (match$1) {
      case /* Home */0 :
          tmp = React.createElement(Home.make, {});
          break;
      case /* ElectionNew */1 :
          tmp = React.createElement(ElectionNew.make, {});
          break;
      case /* User_Profile */2 :
          tmp = React.createElement(User_Profile.make, {});
          break;
      case /* User_Register */3 :
          tmp = React.createElement(User_Register.make, {});
          break;
      
    }
  } else {
    tmp = match$1.TAG === /* User_Register_Confirm */3 ? React.createElement(User_Register_Confirm.make, {}) : React.createElement(ElectionShow.make, {});
  }
  return React.createElement(ReactNativePaper.Provider, {
              children: React.createElement(Context.State.Provider.make, {
                    value: state,
                    children: React.createElement(Context.Dispatch.Provider.make, {
                          value: dispatch,
                          children: React.createElement(ReactNative.SafeAreaView, {
                                style: X.styles.layout,
                                children: React.createElement(ReactNative.ScrollView, {
                                      children: null
                                    }, React.createElement(ReactNativePaper.Appbar.Header, {
                                          children: null
                                        }, React.createElement(ReactNativePaper.Appbar.Action, {
                                              icon: "home",
                                              onPress: (function (param) {
                                                  Curry._1(dispatch, {
                                                        TAG: /* Navigate */12,
                                                        _0: /* Home */0
                                                      });
                                                })
                                            }), React.createElement(ReactNativePaper.Appbar.Content, {
                                              title: ""
                                            }), React.createElement(ReactNativePaper.Appbar.Action, {
                                              icon: "account",
                                              onPress: (function (param) {
                                                  Curry._1(dispatch, {
                                                        TAG: /* Navigate */12,
                                                        _0: /* User_Profile */2
                                                      });
                                                })
                                            })), tmp)
                              })
                        })
                  }),
              theme: {
                dark: true
              }
            });
}

var make = App;

export {
  make ,
}
/* X Not a pure module */
