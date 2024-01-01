const fs = require('fs');
const sqlite3 = require('sqlite3').verbose();

const FLAG1 = fs.readFileSync('/flag1.txt', 'utf8').trim();
const db = new sqlite3.Database('/etc/db.sqlite3');
db.exec(`
DROP TABLE IF EXISTS users;
CREATE TABLE db (
    users JSON NOT NULL
);
INSERT INTO db(users) VALUES ('{
    "admin": {
        "username": "admin",
        "password": "${FLAG1}"
    },
    "guest": {
        "username": "guest",
        "password": "guest"
    }
}');
`);
