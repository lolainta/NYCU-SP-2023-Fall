from fastapi import FastAPI, Request, Response
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware



import random
import string

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root(req: Request):
    print(req.headers)
    return {"Hello": "World"}


def gen_random_string(length):
    return "".join(random.choice(string.ascii_letters) for i in range(length))


db = {}


@app.post("/api")
async def solve(
    req: Request,
):
    # print(req.headers)
    body = (await req.body()).decode("utf-8")
    # print(body)
    body = body[6:-7].split("|")
    assert body[0] == "URL"
    origin = body[2]
    assert len(origin) == int(body[1])
    short = body[3] if len(body) > 3 else gen_random_string(8)
    if short not in db:
        db[short] = origin
    else:
        msg = "duplicated"
        return JSONResponse(
            content=f"[gusp]ERROR|{len(msg)}|{msg}|[/gusp]",
            headers={"Content-Type": "application/gusp"},
        )
    return JSONResponse(
        content=f"[gusp]SUCCESS|{len(short)}|{short}|[/gusp]",
        headers={"Content-Type": "application/gusp"},
    )


# 1e7a0a83-bc23-478e-8797-7bae3d80f138⏎
@app.get("/clear")
def clear():
    print(db)
    db.clear()
    return "OK"


@app.get("/api/abc123")
async def TonyChi(req: Request):
    return Response(status_code=302, headers={"Location": "/flag"})


@app.get("/api/data")
async def TonyChi(req: Request):
    if 'data' in req.headers:
        print(req.headers["data"])
    return {"msg": "ok"}


@app.get("/api/{short}")
async def redirect(short: str):
    if short in db.keys():
        ## return 302 with headers
        return Response(
            status_code=302,
            headers={"Location": db[short]},
        )
    else:
        return Response(
            status_code=404,
        )
