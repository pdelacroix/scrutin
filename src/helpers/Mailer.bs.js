// Generated by ReScript, PLEASE EDIT WITH CARE

import * as X from "./X.bs.js";
import * as Config from "./Config.bs.js";
import * as Identity from "../model/Identity.bs.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";

var relay_url = "" + Config.api_url + "/proxy_email";

function send(ballotId, orgId, voterId, email) {
  var hexSecretKey = Belt_Option.getExn(voterId.hexSecretKey);
  var timestamp = (Date.now());
  var hexTimestamp = timestamp.toString(16);
  var hexSignedTimestamp = Identity.signHex(orgId, hexTimestamp);
  var message = "\n    Hello !\n    Vous êtes invité à une election.\n    Cliquez ici pour voter :\n    https://scrutin.app/ballots/" + ballotId + "#" + hexSecretKey + "\n  ";
  var dict = {};
  dict["email"] = email;
  dict["subject"] = "Vous êtes invité à un election";
  dict["text"] = message;
  dict["hexPublicKey"] = orgId.hexPublicKey;
  dict["hexTimestamp"] = hexTimestamp;
  dict["hexSignedTimestamp"] = hexSignedTimestamp;
  X.post(relay_url, dict);
}

export {
  relay_url ,
  send ,
}
/* X Not a pure module */