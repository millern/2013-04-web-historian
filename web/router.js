var fs = require('fs');
var trail = require('path');
var qs = require('querystring');
var moment = require('moment');
var dataFile = require('./dataFile.js');
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
      pattern: /([w]*\.[^+]*\.[^+]*[\/][^.]*)/,
      method: function(request, response, path){
        headers['content-type'] = 'text/html';
        fs.readFile(trail.join(__dirname,'..','data/sites',path), 'utf8', function(error, data){
          if(error) console.log(error);
          response.writeHead(200, headers);
          response.end(data);
        });
      }
    },
    {
      pattern: /([w]*\.[^+]*\.[^+]*)$/,
      method: function(request, response, path){
        headers['content-type'] = "text/html";
        if (dataFile.hasData(path)){
          var files = dataFile.getData(path);
          var body = "";
          response.writeHead(200,headers);
          for (var i = 0; i < files.length; i++) {
            body+=('<a href="'+path+'/'+files[i]+'">'+files[i]+'</a><br />');
          }
          response.end(body);
        } else {
          response.writeHead(404,headers);
          response.end();
        }

      }
    },
    {
      pattern: /([^+]*)\.([^+]*)/,
      method: function (request, response, path, filetype) {
        var file = fs.readFile(__dirname + '/public/' + path + '.' + filetype, 'utf8', function(error, data) {
          if (error) console.log(error);
          headers['content-type']  = "text/"+filetype;
          response.writeHead(200, headers);
          response.end(data);
        });
      }
    },
    {
      pattern: /\/$/,
      method: function(request, response, target) {
        var file = fs.readFile(__dirname + '/public/index.html', 'utf8', function(error, data) {
          if (error) console.log(error);
          headers['content-type'] = 'text/html';
          response.writeHead(200, headers);
          response.end(data);
        });
      }
    },
    {
     pattern: /[^+]*/,
     method: function(request, response, target){
      response.writeHead(404, headers);
      response.end();
     }
    }
  ],

  "POST": [
    {
     pattern: /\/$/,
     method: function(request, response, target){
      var body = "";
      request.on('data', function(data){
        body += data;
        if (body.length > 1e6) { // 1e6 === 1 * Math.pow(10, 6) === 1 * 1000000 ~~~ 1MB
          request.connection.destroy(); // FLOOD ATTACK OR FAULTY CLIENT, NUKE REQUEST
        }
      });
      request.on('end', function(){
        var parseBody = qs.parse(body); //write to the end of the file
          dataFile.setData(parseBody.url, moment().format("YYYY_MMMM_Do_hh_mm"));
      });
      response.writeHead(201,headers);
      response.end();
     }
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