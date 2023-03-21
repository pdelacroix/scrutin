// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as StateEffect from "./StateEffect.bs.js";
import * as Belt_MapString from "rescript/lib/es6/belt_MapString.js";

var initial_txs = [];

var initial_ids = [];

var initial_trustees = [];

var initial_contacts = [];

var initial = {
  txs: initial_txs,
  ids: initial_ids,
  trustees: initial_trustees,
  contacts: initial_contacts,
  route: /* Home_Elections */0,
  cached_elections: undefined,
  cached_ballots: undefined,
  cached_tallies: undefined
};

function reducer(state, action) {
  if (typeof action === "number") {
    return [
            initial,
            [
              StateEffect.identities_fetch,
              StateEffect.transactions_get,
              StateEffect.trustees_fetch,
              StateEffect.contacts_fetch,
              StateEffect.goToUrl,
              StateEffect.importIdentityFromUrl
            ]
          ];
  }
  switch (action.TAG | 0) {
    case /* Navigate */0 :
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: action._0,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                []
              ];
    case /* Identity_Add */1 :
        var ids = Belt_Array.concat(state.ids, [action._0]);
        return [
                {
                  txs: state.txs,
                  ids: ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [(function (param) {
                      return StateEffect.identities_store(ids, param);
                    })]
              ];
    case /* Transaction_Add */2 :
        var tx = action._0;
        var txs = Belt_Array.concat(state.txs, [tx]);
        return [
                {
                  txs: txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [(function (param) {
                      return StateEffect.cache_update(tx, param);
                    })]
              ];
    case /* Transaction_Add_With_Broadcast */3 :
        var tx$1 = action._0;
        var txs$1 = Belt_Array.concat(state.txs, [tx$1]);
        return [
                {
                  txs: txs$1,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [
                  (function (param) {
                      return StateEffect.transaction_broadcast(tx$1, param);
                    }),
                  (function (param) {
                      return StateEffect.cache_update(tx$1, param);
                    })
                ]
              ];
    case /* Trustee_Add */4 :
        var trustees = Belt_Array.concat(state.trustees, [action._0]);
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [(function (param) {
                      return StateEffect.trustees_store(trustees, param);
                    })]
              ];
    case /* Contact_Add */5 :
        var contacts = Belt_Array.concat(state.contacts, [action._0]);
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [(function (param) {
                      return StateEffect.contacts_store(contacts, param);
                    })]
              ];
    case /* Contact_Remove */6 :
        var index = action._0;
        var contacts$1 = Belt_Array.keepWithIndex(state.contacts, (function (param, i) {
                return i !== index;
              }));
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: contacts$1,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                [(function (param) {
                      return StateEffect.contacts_store(contacts$1, param);
                    })]
              ];
    case /* Cache_Election_Add */7 :
        var cached_elections = Belt_MapString.set(state.cached_elections, action._0, action._1);
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                []
              ];
    case /* Cache_Ballot_Add */8 :
        var cached_ballots = Belt_MapString.set(state.cached_ballots, action._0, action._1);
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: cached_ballots,
                  cached_tallies: state.cached_tallies
                },
                []
              ];
    case /* Cache_Tally_Add */9 :
        var cached_tallies = Belt_MapString.set(state.cached_tallies, action._0, action._1);
        return [
                {
                  txs: state.txs,
                  ids: state.ids,
                  trustees: state.trustees,
                  contacts: state.contacts,
                  route: state.route,
                  cached_elections: state.cached_elections,
                  cached_ballots: state.cached_ballots,
                  cached_tallies: cached_tallies
                },
                []
              ];
    
  }
}

function getBallot(state, id) {
  return Belt_MapString.getExn(state.cached_ballots, id);
}

function getElection(state, id) {
  return Belt_MapString.getExn(state.cached_elections, id);
}

export {
  initial ,
  reducer ,
  getBallot ,
  getElection ,
}
/* StateEffect Not a pure module */
