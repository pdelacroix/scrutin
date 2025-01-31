const express = require('express')
const asyncHandler = require('express-async-handler')
const cors = require('cors') // TODO: Configure cors
require('dotenv').config()

const { Sequelize, Op } = require('sequelize')
const sequelize = new Sequelize(process.env.DATABASE_URL)
const { Event } = require('./models')(sequelize)
sequelize.sync()

const app = express()
app.use(express.json())
app.use(cors())

app.get('/', (req, res) => {
  res.send('<h1>Hello :)</h1>')
})

app.get('/events', async (req, res) => {
  const events = await Event.findAll()
  res.json(events.map((o) => o.toJSON()))
})

app.post('/events', cors(), asyncHandler(async (req, res) => {
  const { type_, content, cid, publicKey, signature } = req.body
  try {
    const event_ = await Event.create({
      type_,
      content,
      cid,
      publicKey,
      signature
    })
    res.json(event_.toJSON())
  } catch (e) {
    console.error(e)
    res.status(500).json({ message: "internal error" })
  }
}))

// For testing (in production it's sent to the mailing server instead)
const fs = require('fs').promises
app.post('/proxy_email', cors(), asyncHandler(async (req, res) => {
  try {
    //if (!await fs.exists("emails")) {
    //  await fs.mkdir("emails")
    //}
    await fs.mkdir("emails")
    await fs.writeFile("emails/"+req.body.email, req.body.text)
  } catch (e) {
    console.error(e)
    res.status(500).json({ message: "internal error" })
  }
}))

const port = process.env.PORT || 8080
app.listen(port, () => console.log(`app listening on port ${port}!`))
