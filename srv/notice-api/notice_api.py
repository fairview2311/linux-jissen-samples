import json
from http.server import BaseHTTPRequestHandler, HTTPServer

NOTICES = [
    {"date": "2026-11-25", "title": "11月の棚卸し"},
    {"date": "2026-12-01", "title": "年末の大掃除の当番"},
    {"date": "2026-12-10", "title": "忘年会の出欠"},
    {"date": "2026-12-25", "title": "年末年始の休業日"},
]


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/api/notices":
            data = {"notices": NOTICES}
            body = json.dumps(data, ensure_ascii=False).encode("utf-8")
            self.send_response(200)
            self.send_header("Content-Type",
                             "application/json; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_error(404)


if __name__ == "__main__":
    server = HTTPServer(("127.0.0.1", 8000), Handler)
    print("notice-api: 127.0.0.1:8000 で待ち受けます", flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("notice-api: 停止しました")
