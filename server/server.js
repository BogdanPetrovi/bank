const express = require('express')
const cors = require('cors')
var morgan = require('morgan')
require('dotenv').config()

const app = express()
app.use(cors({
  origin: 'http://localhost:3000',
}))
app.use(morgan('dev'))
const port = process.env.PORT

app.listen(port, () => {
  console.log(`App is up and listening on port ${port}!`)
})