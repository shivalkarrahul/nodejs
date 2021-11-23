var http = require('http');

var server = http.createServer(function(request, response) {

    response.writeHead(200, {"Content-Type": "text/plain"});
    response.end("Hello, Welcome to the Demo App for Capstone Project 3 - Post Graduate Program - DevOps");

});

var port = 3000;
server.listen(port);
module.exports = server
console.log("Server is available on Port:", port);
