// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as State from "./State.bs.js";
import * as React from "react";
import * as Header from "./components/Header.bs.js";
import * as Layout from "./components/Layout.bs.js";
import * as UseTea from "rescript-use-tea/src/UseTea.bs.js";
import * as Ballot_Show from "./components/Ballot_Show.bs.js";
import * as ElectionNew from "./components/ElectionNew.bs.js";
import * as ElectionShow from "./components/ElectionShow.bs.js";
import * as Trustee_Home from "./components/Trustee_Home.bs.js";
import * as Contact_Index from "./components/Contact_Index.bs.js";
import * as Election_Home from "./components/Election_Home.bs.js";
import * as Identity_Home from "./components/Identity_Home.bs.js";
import * as Identity_Show from "./components/Identity_Show.bs.js";
import * as Settings_View from "./components/Settings_View.bs.js";
import * as Transaction_Home from "./components/Transaction_Home.bs.js";

function App(Props) {
  var match = UseTea.useTea(State.reducer, State.initial);
  var dispatch = match[1];
  var state = match[0];
  React.useEffect((function () {
          Curry._1(dispatch, /* Reset */0);
        }), []);
  var electionId = state.route;
  var tmp;
  if (typeof electionId === "number") {
    switch (electionId) {
      case /* Home_Elections */0 :
          tmp = React.createElement(Election_Home.make, {});
          break;
      case /* Home_Trustees */1 :
          tmp = React.createElement(Trustee_Home.make, {});
          break;
      case /* Home_Identities */2 :
          tmp = React.createElement(Identity_Home.make, {});
          break;
      case /* Home_Transactions */3 :
          tmp = React.createElement(Transaction_Home.make, {});
          break;
      case /* Contact_Index */4 :
          tmp = React.createElement(Contact_Index.make, {});
          break;
      case /* Election_New */5 :
          tmp = React.createElement(ElectionNew.make, {});
          break;
      case /* Settings */6 :
          tmp = React.createElement(Settings_View.make, {});
          break;
      
    }
  } else {
    switch (electionId.TAG | 0) {
      case /* Election_Show */0 :
          tmp = React.createElement(ElectionShow.make, {
                electionId: electionId._0
              });
          break;
      case /* Identity_Show */1 :
          tmp = React.createElement(Identity_Show.make, {
                publicKey: electionId._0
              });
          break;
      case /* Ballot_Show */2 :
          tmp = React.createElement(Ballot_Show.make, {
                ballotId: electionId._0
              });
          break;
      
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
/* State Not a pure module */
