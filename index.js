const express = require('express')
const consumeMemoryForDuration = require('./memory')
const app = express()
let counter = 0

app.get('/', function (req, res) {
  res.send('Scalable App. IP: ' + req.ip)
})

app.post('/', function (req, res) {
  res.send('Scalable App. IP: ' + req.ip)
})

app.post('/app/memory', async function (req, res) {
  try {
    consumeMemoryForDuration(req.query.size, req.query.time)
    counter++
    res.send('memory')
  } catch (e) {
    console.error(e)
    res.send('error')
  }
})

app.get('/app/cpu', function (req, res) {
  res.send('cpu')
})

// setInterval(() => { 
//   gc()
//   console.log('Calls: ', counter)
// }, 5000)

app.listen(3000)


