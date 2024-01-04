import requests
import datetime

# url = "http://localhost:10082"
url = "http://10.113.184.121:10082"


def addNote(s: requests.Session, title: str, content: str):
    r = s.post(
        url + "/api/notes",
        json={"title": str(title), "content": content},
    )
    print(r.text)
    return r.json()["id"]


def getContent() -> str:
    ret = ""
    with open("tmp.html", "r") as f:
        ret = f.readline()
    return ret


def test():
    username = "rrrrrr"
    password = "abc123"
    data = {"username": username, "password": password}
    s = requests.Session()
    r = s.post(url + "/login", data=data)
    r = s.post(url + "/login", data=data)
    time = datetime.datetime.now().ctime()
    print(time)
    content = getContent()
    print(content)
    id = addNote(s, time, content)
    print(id)
    r = s.get(url + f"/api/notes", params={"id": id, "author": username})
    print(r.text)
    r = s.post(url + "/report", data={"note_id": id, "author": username})
    print(r.text)


def main():
    test()


if __name__ == "__main__":
    main()
