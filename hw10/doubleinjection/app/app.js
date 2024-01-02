const express = require('express');
const ejs = require('ejs');
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');
const FLAG1 = fs.readFileSync('/flag1.txt', 'utf8').trim();

const db = new sqlite3.Database('/etc/db.sqlite3');

const app = express();
app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res) => {
    res.send(`
    <form action="/login" method="POST">
        <input type="text" name="username" placeholder="Username">
        <input type="password" name="password" placeholder="Password">
        <input type="submit" value="Login">
    </form>`
    );
});

app.post('/login', (req, res) => {
    const { username, password } = req.body;
    console.log();
    console.log(req.body)
    console.log(typeof(username), username);
    console.log(typeof(password), password);
    const jsonPath = JSON.stringify(`$.${username}.password`);
    const query = `SELECT json_extract(users, ${jsonPath}) AS password FROM db`;
    console.log(query);
    const template = `
    <html>
        <head><title>Success</title></head>
        <body>
            <h1>Success!</h1>
            <p>Logged in as ${username}</p>
        </body>
    </html>
    `
    db.get(query, (err, row) => {
        if (res.headersSent) return;
        if (err) return res.status(500).send('Internal Server Error' + err);
        console.log(row);
        if (row.password === password) {
            if (password !== FLAG1) {
                const html = ejs.render(`<h1>Success!</h1>`, { username });
                return res.send(html);
            } else {
                const html = ejs.render(template, { username });
                return res.send(html);
            } 
        } else {
            return res.status(401).send('Unauthorized');
        }
    });

    res.setTimeout(Math.random() * 50 + 10, () => res.status(401).send('Unauthorized'));
});


app.listen(3000, () => console.log('Listening on port 3000'));
