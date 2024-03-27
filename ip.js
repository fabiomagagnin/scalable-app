const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Scalable App. IP: ' + req.ip)
})

app.post('/', function (req, res) {
  res.send('Scalable App. IP: ' + req.ip)
})

app.listen(3000)


