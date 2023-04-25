// The state of the application.

type t = {
  // See [[Event]].
  // We use this to populate elections and ballots
  events: array<Event_.t>,
  // If we are syncing events
  fetchingEvents: bool,
  // The controlled identities (as voter or election organizer)
  // See [[Identity]]
  ids: array<Account.t>,
  // The controlled election private key (for tallying)
  // See [[Trustee]]
  trustees: array<Trustee.t>,
  // Contacts, to keep track on who is associated with which public key
  invitations: array<Invitation.t>,
  // The current route (still waiting for a decent rescript router
  // that works on web and native)
  route: list<string>,
  // elections (from parsed events)
  elections: Map.String.t<Election.t>,
  // opposite of election.previousId
  electionLatestIds: Map.String.t<string>,
  // ballots (from parsed events)
  ballots: array<Ballot.t>
}

// The initial state of the application
let initial = {
  route: list{""},
  events: [],
  fetchingEvents: true,
  ids: [],
  trustees: [],
  invitations: [],
  elections: Map.String.empty,
  electionLatestIds: Map.String.empty,
  ballots: []
}

//let getBallot = (state, id) => Map.String.get(state.ballots, id)
//let getBallotExn = (state, id) => Map.String.getExn(state.ballots, id)

let getElection = (state, id) => Map.String.get(state.elections, id)
let getElectionExn = (state, id) => Map.String.getExn(state.elections, id)

let getAccount = (state, publicKey) => Array.getBy(state.ids, id => publicKey == id.hexPublicKey)
let getAccountExn = (state, publicKey) => getAccount(state, publicKey)->Option.getExn

let getInvitation = (state, publicKey) => Array.getBy(state.invitations, invitation => publicKey == invitation.publicKey)
let getInvitationExn = (state, publicKey) => getInvitation(state, publicKey)->Option.getExn

let getElectionValidBallots = (state, electionId) => {
  state.ballots
  ->Array.keep((ballot) => ballot.electionId == electionId)
  ->Js.Array2.map((ballot) => (ballot.voterId, ballot))
  ->Js.Dict.fromArray
  ->Js.Dict.values
}

let getElectionAdmin = (state, election:Election.t) =>
  Array.getBy(state.ids, (account) => {
    Array.getBy(election.adminIds, (userId) => userId == account.hexPublicKey)
    -> Option.isSome
  }) -> Option.getExn
