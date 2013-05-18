var fs = require('fs');

exports.readUrls = function(filePath, cb){
  var urlHash;
  var file = fs.readFile(filePath, 'utf8', function(error,data){
    console.log(data);
    urlHash = JSON.parse(data);
    console.log(urlHash);
    var returnArray = [];
    for(var key in urlHash){
      console.log(key);
      cb(key);
    }
  });
};

exports.downloadUrls = function(urls){
  // fixme
};