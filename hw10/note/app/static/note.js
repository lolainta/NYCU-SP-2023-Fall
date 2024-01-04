const noteId = new URLSearchParams(window.location.search).get('id');
const author = new URLSearchParams(window.location.search).get('author');
let apiUrl = '/api/notes?id=' + noteId;
if (author) apiUrl += '&author=' + author;
fetch(apiUrl)
    .then(res => res.json())
    .then(result => {
        if (result.error) {
            alert(result.error);
            location.href = "/";
            return;
        }
        const note = document.querySelector('#note');
        note.innerHTML = `
                <h1>${result.title}</h1>
                <p>${marked.parse(result.content)}</p>
                <hr/>
                <span style="color: #999">
                    By @${result.author}・🔒 Private・
                    <form action="/report" style="display: inline" method="post">
                        <input type="hidden" name="note_id" value="${noteId}">
                        <input type="hidden" name="author" value="${result.author}">
                        <input type="submit" value="Report">
                    </form>
                </span>
                `;
        note.querySelector('form').addEventListener('submit', e => {
            e.preventDefault();
            if (!confirm('Are you sure to report this note?')) return;
            e.target.submit();
        })
    });
