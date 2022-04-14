from http.server import BaseHTTPRequestHandler, HTTPServer
import logging

hostName = "localhost"
serverPort = 8080


class Handler(BaseHTTPRequestHandler):
    def _set_response(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self._set_response()
            self.wfile.write("GET request for {}".format(
                self.path).encode('utf-8'))
        else:
            logging.info("404 response")
            self.send_error(404, "Not found")


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), Handler)
    logging.basicConfig(filename='/home/baner/monitoring/telegraf/scripts/web_server/404.log', level=logging.INFO,
                        format='%(asctime)s-%(levelname)s-%(message)s', filemode="w")
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
