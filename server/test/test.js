// const { hash } = require("sjcl-with-all")
const { hashAndSign } = require('scrutin-common/src/Event.bs')

Credential = require('scrutin-common/src/Credential.bs.js')
Event = require('scrutin-common/src/Event.bs.js')

orgCredentials = Credential.make()
user1Credentials = Credential.make()
user2Credentials = Credential.make()

const election = Event.Election.create('params', 'trustees', orgCredentials.publicKey)
console.log(election)

signedEvent = Event.Signed.wrap(election, orgCredentials.secretKey)

console.log(signedEvent)
console.log(signedEvent.sig)

const signedElection = Event.Signed.Election.create('params', 'trustees', orgCredentials)
console.log(signedElection)

const signedBallot = Event.Signed.Ballot.create(signedElection.hash, user1Credentials.publicKey, orgCredentials)
console.log(signedBallot)

/*
// Note to myself:
// DO NOT CREATE THE CONCEPT OF ORGANISATION OR USER YET!
// ONLY USE PUBLIC KEYS AS OWNER. THAT HAS THE SAME EFFECT
// Creating an organisation
let [org, orgCredentials] = Event.Org.create()
console.log(org)
console.log(orgCredentials)
// Creating a new user
let [userEvent, userCredentials] = Event.User.create()
console.log(userEvent)
console.log(userCredentials)
*/
