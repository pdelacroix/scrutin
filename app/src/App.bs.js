// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Home from "./components/Home.bs.js";
import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "./state/State.bs.js";
import * as React from "react";
import * as Header from "./Header.bs.js";
import * as Layout from "./Layout.bs.js";
import * as UseTea from "rescript-use-tea/src/UseTea.bs.js";
import * as ElectionNew from "./components/ElectionNew.bs.js";
import * as ElectionShow from "./components/ElectionShow.bs.js";
import * as User_Profile from "./components/User_Profile.bs.js";
import * as User_Register from "./components/User_Register.bs.js";
import * as Admin_User_Show from "./components/Admin_User_Show.bs.js";
import * as User_Register_Confirm from "./components/User_Register_Confirm.bs.js";

function App(Props) {
  var match = UseTea.useTea(State.reducer, State.initial);
  var dispatch = match[1];
  var state = match[0];
  React.useEffect((function () {
          Curry._1(dispatch, /* Init */0);
        }), []);
  var user = state.route;
  var tmp;
  if (typeof user === "number") {
    switch (user) {
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
    switch (user.TAG | 0) {
      case /* User_Register_Confirm */3 :
          tmp = React.createElement(User_Register_Confirm.make, {});
          break;
      case /* Admin_User_Show */4 :
          tmp = React.createElement(Admin_User_Show.make, {
                user: user._0
              });
          break;
      default:
        tmp = React.createElement(ElectionShow.make, {});
    }
  }
  return React.createElement(Layout.make, {
              state: state,
              dispatch: dispatch,
              children: null
            }, React.createElement(Header.make, {}), tmp);
}

var make = App;

export {
  make ,
}
/* Home Not a pure module */
