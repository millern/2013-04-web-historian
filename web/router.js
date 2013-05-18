var fs = require('fs');
var defaultCorsHeaders = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  "access-control-allow-headers": "content-type, accept",
  "access-control-max-age": 10 // Seconds.
};
var headers = defaultCorsHeaders;

var routes = {
  "GET": [
    {
      pattern: /([^+]*)\.([^+]*)/,
      method: function (request, response, path, filetype) {
        if (!(filetype === "ico")) {
        console.log("GET request received");
        var file = fs.readFile('public/' + path + '.' + filetype, 'utf8', function(error, data) {
          console.log('public'+path+'.'+filetype);
          if (error) throw error;
          headers['content-type']  = "text/"+filetype;
          response.writeHead(200, headers);
          response.end(data);
        });
        }
      }
    },
    {
      pattern: /\/$/,
      method: function(request, response, target) {
        console.log("TRUE DIR NAME");
        console.log(__dirname + '/public/index.html');
        var file = fs.readFile(__dirname + '/public/index.html', 'utf8', function(error, data) {
          if (error) throw error;
          headers['content-type'] = 'text/html';
          response.writeHead(200, headers);
          response.end(data);
        });
      }
    },
    {
     pattern: /[^+]*/,
     method: function(request, response, target){
      console.log("GET request received");
      response.writeHead(200, headers);
      response.end('matched default string');
     }
    }
  ],

  "POST": [
    {

    }
  ],

  "OPTIONS": [
    {

    }
  ]
};
exports.route = function(target, method, request, response){
  routes[method].some(function(item){
    var params = target.match(item.pattern);
    if (params) {
      item.method.apply(null, [request, response].concat(params.slice(1)));
      return true;
    }
  });
};