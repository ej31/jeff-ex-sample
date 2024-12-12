const my = require('mysql2')
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

const gw = (req, res, next) => {
    console.log(`[${req.rawHeaders[1]}][${req.method}] ${req.url} `)
    next()
}

app.use(gw)
app.get('/', (req, res) => {
  res.send('헬로 월드🌸 after PR!');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
