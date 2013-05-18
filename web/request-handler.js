var url = require('url');
var router = require('./router.js');
exports.datadir = __dirname + "data/sites.txt"; // tests will need to override this.

exports.handleRequest = function (request, response) {
  console.log(url.parse(request.url));
  router.route(url.parse(request.url).pathname, request.method, request, response);
};
