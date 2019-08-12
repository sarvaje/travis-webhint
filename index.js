const fs = require('fs');
const path = require('path');

const express = require('express');
const app = express();
const port = 3000;

const html = path.join(__dirname, 'html2', 'index.html');

app.use(express.static(path.join(__dirname, 'html2')));

app.get('/', (req, res) => {
    res.set('Content-Type', 'text/html');
    res.render(html);
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));