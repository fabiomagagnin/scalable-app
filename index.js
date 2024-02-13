const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Scalable App')
})

app.get('/app/memory', function(req, res) {
    res.send('memory')
})

app.get('/app/cpu', function(req, res) {
    res.send('cpu')
})

app.listen(80)