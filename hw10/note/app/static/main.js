function updateNoteList() {
    fetch('/api/notes/all')
        .then(res => res.json())
        .then(result => {
            const noteList = document.querySelector('#noteList');
            noteList.innerHTML = '';
            result.forEach(note => {
                const div = document.createElement('div');
                div.className = 'note'
                const h2 = document.createElement('h2');
                h2.innerText = note.title;
                div.appendChild(h2);
                const p = document.createElement('p');
                p.innerText = `Author: ${note.author || '(anonymous)'}`;
                div.appendChild(p);

                div.onclick = () => location.href = `/note?id=${note.id}`;
                noteList.appendChild(div);
            });
        })
}

const form = document.querySelector('#form');
form.addEventListener('submit', (e) => {
    e.preventDefault();
    const data = {
        title: form.title.value,
        content: form.content.value
    };
    fetch('/api/notes', {
        method: 'POST',
        body: JSON.stringify(data),
        headers: new Headers({
            'Content-Type': 'application/json'
        })
    }).then(res => res.json())
        .then(result => {
            form.title.value = '';
            form.content.value = '';
            if (result.error) {
                alert(result.message);
                return;
            }
            updateNoteList();
        })
})

updateNoteList();
