const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Scalable App. IP: ' + req.ip + ' - ' + new Date())
})

app.get('/hello', async function (req, res) {
  res.json({hello: 'hello!', time: new Date()})
})

app.listen(3000)


