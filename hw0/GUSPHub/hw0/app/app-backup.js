const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const uuid = require('uuid');
const dns = require('dns');
const puppeteer = require('puppeteer');


const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

let browser = null;

const port = process.env.PORT || 3000;
const flag = process.env.FLAG || 'FLAG{fake_flag}';

const randInt = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;
const randStr = (length) => Buffer.from(Array(length).fill(0).map(() => randInt(0, 0xff))).toString('base64url');


const GUSPServices = new Map();

app.get('/', (_, res) => {
    res.sendFile(__dirname + '/html/index.html');
});

app.get('/flag', (req, res) => {
    // only allow localhost users to get the flag -- which is the bot
    // bot? see /report handler
    if (req.headers['give-me-the-flag'] === 'yes' &&
        req.ip.endsWith('127.0.0.1')) {
        return res.send(flag);
    }
    res.send('No flag for you');
});

app.get('/:id/:alias', (req, res) => {
    const { id, alias } = req.params;
    if (!GUSPServices.has(id)) {
        res.status(404).send('API not found');
        return;
    }

    const { url, javascript } = GUSPServices.get(id);
    fetch(url + '/' + alias, { redirect: 'manual' }).then(r => {
        if (r.status !== 302) {
            res.status(404).send('Alias not found');
            return;
        }
        const originalUrl = r.headers.get('Location');
        res.send(`<script>
        const data = ${JSON.stringify({ id, alias, originalUrl })};
        window.onload = () => {
            ${javascript ? javascript :
                'window.location.href = data.originalUrl;'
            }
        }
        </script>`);
    }).catch(err =>
        res.status(500).send(err.message)
    );
});

app.get('/add-api', (req, res) => {
    if (!req.cookies['authenticated'])
        return res.send("You are not authenticated");
    res.sendFile(__dirname + '/html/add-api.html');
});

app.post('/add-api', async (req, res) => {
    if (!req.cookies['authenticated'])
        return res.send("You are not authenticated");

    const { url, javascript } = req.body;


    // Test if the API works as expected
    // You can understand the GUSP protocol by reading thorugh those test cases


    const testCases = [];
    for (let i = 0; i < randInt(15, 20); ++i) {
        let alias = randInt(0, 3) === 0 ? randStr(randInt(3, 10)) : null;
        testCases.push({
            original: `https://${randStr(randInt(3, 10))}.${randStr(randInt(10, 20))}.com/${randStr(randInt(0, 10))}`,
            alias
        });
    }


    const result = Promise.all(
        testCases.map(({ original, alias }) => new Promise((resolve, reject) => {
            const body = alias === null ?
                `[gusp]URL|${original.length}|${original}[/gusp]` :
                `[gusp]URL|${original.length}|${original}|${alias}[/gusp]`;

            fetch(url, {
                method: 'POST',
                headers: { 'Content-Type': 'application/gusp', },
                body
            }).then(res => {
                if (!res.headers.get('Content-Type').startsWith('application/gusp')) {
                    reject(new Error(`Should return Content-Type: application/gusp`));
                }
                return res.text()
            }).then(async res => {
                const [status, length, content] = res.match(/\[gusp\]([^\[]+)\[\/gusp\]/)[1].split('|');
                if (+length !== content.length) {
                    reject(new Error(`Length mismatch: ${length} vs ${content.length}`));
                }

                if (content.match(/[^A-Za-z0-9_-]/)) {
                    reject(new Error(`Invalid alias format ${content}: should only contain A-Za-z0-9_-`));
                }

                if (status !== 'SUCCESS') {
                    reject(new Error(`Should return SUCCESS for non-duplicated alias`));
                }

                const testMode = randInt(0, 4);
                if (testMode <= 2) {
                    // normal visit
                    const redirect = await fetch(new URL(url + '/' + content), { redirect: 'manual' });
                    if (redirect.status !== 302) {
                        reject(new Error(`Should redirect with status 302`));
                    }
                    const location = redirect.headers.get('Location').trim();
                    if (location !== original) {
                        reject(new Error(`${content}: Should redirect to ${original}, but got ${location}`));
                    }
                } else if (testMode === 3) {
                    // visit a non-exist alias
                    const redirect = await fetch(new URL(url + '/' + randStr(randInt(3, 10))), { redirect: 'manual' });
                    if (redirect.status !== 404) {
                        reject(new Error(`Should return 404 for non-exist alias`));
                    }
                } else if (testMode === 4) {
                    // create a duplicated alias
                    const body = `[gusp]URL|${original.length}|${original}|${alias}[/gusp]`;
                    const res = await fetch(url, {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/gusp', },
                        body
                    }).then(res => res.text());
                    const [status, _, __] = res.match(/\[gusp\]([^\[]+)\[\/gusp\]/)[1].split('|');
                    if (status !== 'ERROR') {
                        reject(new Error(`Should return ERROR for duplicated alias`));
                    }
                }
                resolve();
            }).catch(err => reject(err));
        }))
    );

    result.then(() => {
        const id = uuid.v4();
        GUSPServices.set(id, { url, javascript });
        res.send(`Your API is working! API ID is ${id}`);
    }).catch(err => {
        res.send(`Your API is not working: ${err.message}`);
    });

});

// admin bot part

async function visit(id, alias) {
    const url = `http://127.0.0.1:${port}/${id}/${alias}`;
    console.log(`[+] Visiting ${url}`);
    const context = await browser.createIncognitoBrowserContext()
    const page = await context.newPage()
    try {
        await page.goto(url, { waitUntil: 'networkidle0' })
    } catch (e) {
        console.error(`[+] error visting ${path}`, e)
    }
    await page.close()
    await context.close()
}

app.get('/report', (_, res) => {
    res.send(`
    <form action="/report" method="POST">
        <input type="text" name="id" placeholder="API ID">
        <input type="text" name="alias" placeholder="Alias">
        <input type="submit" value="Report">
    </form>
    `);
});


app.post('/report', (req, res) => {
    // make the bot visit the GUSP service with the given id and alias

    const { id, alias } = req.body;
    if (!GUSPServices.has(id)) {
        res.status(404).send('API not found');
        return;
    }

    if (alias.match(/[^A-Za-z0-9_-]/)) {
        return res.send('Invalid alias');
    }

    visit(id, alias);
    res.send('Admin will check your report');
});

app.listen(port, async () => {
    console.log('Listening on port 3000');
    browser = await puppeteer.launch({
        pipe: true,
        dumpio: true,
        args: ['--js-flags=--jitless,--no-expose-wasm', '--disable-gpu', '--disable-dev-shm-usage', '--no-sandbox'],
        headless: 'new'
    });
});
