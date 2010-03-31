var sys = require("sys"),
  http = require("http"),
  url = require("url");

exports.version = "0.0.1";

exports.server = http.createServer(function (req, res) {
  var data = "";
  if (req.method === "GET") {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.write("hi!");
    res.close();
  } else if (req.method == "POST") {
    req.addListener("data",function(chunk) {
      data += chunk;
    });
    req.addListener("end",function() {
      res.writeHead(200, {'Content-Type': 'text/plain'});      res.close();
      var uri = url.parse(req.url);
      var path = uri.pathname;
      exports.results = req.method + " " + path + " " + req.url + ": " + data;
      data = "";
    });
  }
});