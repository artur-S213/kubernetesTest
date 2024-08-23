// server.js
const express = require('express');
const app = express();
const port = 3001; // Change the port as needed

let counter = 0;

app.get('/pingpong', (req, res) => {
    res.send(`pong ${counter}`);
    counter++;
});

app.listen(port, () => {
    console.log(`PingPong app listening at http://localhost:${port}`);
    console.log("Another log");
});
