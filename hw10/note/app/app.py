from flask import (
    Flask,
    render_template,
    request,
    redirect,
    url_for,
    flash,
    jsonify,
    session,
)
from uuid import uuid4
from functools import wraps
from secrets import token_urlsafe
import os
import re
import sqlite3
import urllib.request
import sys

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get("SECRET_KEY", "super secret key")
print(app.config["SECRET_KEY"])

from rq import Queue
from redis import Redis

app.queue = Queue(connection=Redis("xss-bot"))

NOTES_DIR = "notes"

users = {"admin": os.environ.get("ADMIN_PASSWORD", "admin")}


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not "username" in session:
            flash("You must be logged in to view this page!", "error")
            return redirect(url_for("login"))
        return f(*args, **kwargs)

    return decorated_function


@app.after_request
def add_header(response):
    # add content security policy header
    response.headers[
        "Content-Security-Policy"
    ] = "default-src 'self'; style-src 'unsafe-inline'; script-src 'self' https://unpkg.com/"
    return response


@app.get("/")
@login_required
def index():
    return render_template("index.html")


@app.get("/login")
def login():
    return render_template("login.html")


@app.post("/login")
def action_login():
    username = request.form.get("username")
    password = request.form.get("password")

    if len(username) < 5 or len(password) < 5:
        flash("Username or password too short!", "error")
        return redirect(url_for("login"))

    if not re.match(r"^[a-zA-Z0-9_]+$", username):
        flash(
            "Username must only contain alphanumeric characters and underscores!",
            "error",
        )
        return redirect(url_for("login"))

    if username in users and users[username] == password:
        session["username"] = username
        return redirect(url_for("index"))
    elif username not in users and not os.path.exists(
        os.path.join(NOTES_DIR, username)
    ):
        users[username] = password
        os.mkdir(os.path.join(NOTES_DIR, username))
        flash("Successfully registered!", "success")
        return redirect(url_for("login"))
    else:
        flash("Invalid username or password!", "error")
        return redirect(url_for("login"))


@app.get("/note")
def note():
    return render_template("note.html")


@app.get("/api/notes/all")
@login_required
def api_notes():
    notes = []
    user_dir = os.path.join(NOTES_DIR, session["username"])
    for filename in os.listdir(user_dir):
        with open(os.path.join(user_dir, filename)) as f:
            notes.append(
                {
                    "id": filename,
                    "author": f.readline().strip(),
                    "title": f.readline().strip(),
                }
            )
    return jsonify(notes)


@app.post("/api/notes")
@login_required
def api_create_note():
    if session["username"] == "admin":
        return {"error": "Admin cannot create notes!"}, 403
    user_dir = os.path.join(NOTES_DIR, session["username"])
    note_id = str(uuid4())
    title, content = request.json["title"], request.json["content"]
    if len(title) > 48 or len(content) > 340:
        return {"error": "Title or content too long!"}, 400
    with open(os.path.join(user_dir, note_id), "w") as f:
        f.write(session["username"] + "\n")
        f.write(title + "\n")
        f.write(content)
    return {"id": note_id}


@app.get("/api/notes")
@login_required
def api_get_note_content():
    note_id = request.args.get("id")
    author = request.args.get("author") or session.get("username")

    if not note_id or ".." in note_id:
        return {"error": "Invalid note ID!"}, 400

    if not author or not re.match(r"^[a-zA-Z0-9_]+$", author):
        return {"error": "Invalid author!"}, 400

    user_dir = os.path.join(NOTES_DIR, author)

    if not os.path.exists(os.path.join(user_dir, note_id)):
        return {"error": "Note not found!"}, 404

    with open(os.path.join(user_dir, note_id)) as f:
        note_author = f.readline().strip()
        title = f.readline().strip()
        content = f.read().strip()

    if session["username"] != "admin" and note_author != session["username"]:
        return {"error": "You do not have permission to view this note!"}, 403

    return {"author": note_author, "title": title, "content": content}


@app.post("/report")
def report():
    note_id = request.form.get("note_id", "")  # uuid
    author = request.form.get("author", "")
    print(note_id, author)

    if not re.match(r"^[a-zA-Z0-9_]+$", author) or not re.match(
        r"^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$", note_id
    ):
        return "Invalid author or note ID!"

    if not os.path.exists(os.path.join(NOTES_DIR, author, note_id)):
        return "Note not found!"

    app.queue.enqueue("bot.browse", "/note?id=" + note_id + "&author=" + author)

    return "<meta http-equiv='refresh' content='1;url=/'><h1>Report submitted!</h1>"
