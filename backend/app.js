const express = require('express')
const cors = require('cors')

const app = express()

const corsOptions = {
  origin: [
    'http://localhost'
  ],
  optionsSuccessStatus: 200
}

app.use(cors(corsOptions))
app.use(express.json())

app.get('/healthcheck', (req, res) => {
  res.send('The Forum backend is running')
})

module.exports = app
