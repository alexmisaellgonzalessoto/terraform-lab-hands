const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "application/json" });
  res.end(JSON.stringify({ message: "API DEV funcionando" }));
});

server.listen(3000, "0.0.0.0");