// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Ballot from "./model/Ballot.bs.js";
import * as Trustee from "./model/Trustee.bs.js";
import * as Belenios from "./helpers/Belenios.bs.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Election from "./model/Election.bs.js";
import * as Identity from "./model/Identity.bs.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Transaction from "./model/Transaction.bs.js";
import * as Belt_MapString from "rescript/lib/es6/belt_MapString.js";

function create(name, desc, choices, state, dispatch) {
  var identity = Belt_Array.get(state.ids, 0);
  var identity$1;
  if (identity !== undefined) {
    identity$1 = identity;
  } else {
    var identity$2 = Identity.make(undefined);
    Curry._1(dispatch, {
          TAG: /* Identity_Add */1,
          _0: identity$2
        });
    identity$1 = identity$2;
  }
  var trustee = Trustee.make(undefined);
  var election = Election.make(name, desc, choices, identity$1.hexPublicKey, trustee);
  var transaction = Transaction.SignedElection.make(election, identity$1);
  Curry._1(dispatch, {
        TAG: /* Transaction_Add */2,
        _0: transaction
      });
  Curry._1(dispatch, {
        TAG: /* Trustee_Add */3,
        _0: trustee
      });
  Curry._1(dispatch, {
        TAG: /* Navigate */0,
        _0: {
          TAG: /* Election_Show */0,
          _0: transaction.eventHash
        }
      });
}

function tally(electionEventHash, state, _dispatch) {
  var election = Belt_MapString.getExn(state.cached_elections, electionEventHash);
  var params = JSON.parse(election.params);
  var trustees = election.trustees;
  var trustee = Belt_Array.getBy(state.trustees, (function (trustee) {
          return Belenios.Trustees.pubkey(trustees) === Belenios.Trustees.pubkey(trustee.trustees);
        }));
  var privkey = Belt_Option.getExn(trustee).privkey;
  var ballots = Belt_Array.keep(Belt_Array.keep(state.txs, (function (tx) {
              return tx.eventType === "ballot";
            })), (function (tx) {
          var ballot = Transaction.SignedBallot.unwrap(tx);
          return ballot.electionTx === electionEventHash;
        }));
  var ciphertexts = Belt_Array.map(Belt_Array.keep(Belt_Array.map(Belt_Array.map(ballots, Transaction.SignedBallot.unwrap), (function (ballot) {
                  return ballot.ciphertext;
                })), (function (ciphertext) {
              return Belt_Option.getWithDefault(ciphertext, "") !== "";
            })), Belt_Option.getExn);
  var pubcreds = Belt_Array.keep(Belt_Array.map(Belt_Array.map(Belt_Array.map(ballots, Transaction.SignedBallot.unwrap), (function (ballot) {
                  return ballot.pubcred;
                })), (function (pubcred) {
              return Belt_Option.getWithDefault(pubcred, "");
            })), (function (pubcred) {
          return pubcred !== "";
        }));
  var match = Belenios.Election.decrypt(params)(ciphertexts, trustees, pubcreds, privkey);
  Belenios.Election.result(params)(ciphertexts, trustees, pubcreds, match[0], match[1]);
}

var Election$1 = {
  create: create,
  tally: tally
};

function emit(param, _state, _dispatch) {
  
}

function vote(ballot, choice, nbChoices, state, dispatch) {
  var selection = Belt_Array.mapWithIndex(Belt_Array.make(nbChoices, 0), (function (i, _e) {
          if (Caml_obj.equal(choice, i)) {
            return 1;
          } else {
            return 0;
          }
        }));
  var election = Belt_MapString.getExn(state.cached_elections, ballot.electionTx);
  var ballot$1 = Ballot.make(ballot, election, selection);
  var owner = Belt_Option.getExn(Belt_Array.getBy(state.ids, (function (id) {
              return ballot$1.voterPublicKey === id.hexPublicKey;
            })));
  var tx = Transaction.SignedBallot.make(ballot$1, owner);
  Curry._1(dispatch, {
        TAG: /* Transaction_Add */2,
        _0: tx
      });
  Curry._1(dispatch, {
        TAG: /* Navigate */0,
        _0: {
          TAG: /* Election_Show */0,
          _0: ballot$1.electionTx
        }
      });
}

var Ballot$1 = {
  emit: emit,
  vote: vote
};

export {
  Election$1 as Election,
  Ballot$1 as Ballot,
}
/* Ballot Not a pure module */
