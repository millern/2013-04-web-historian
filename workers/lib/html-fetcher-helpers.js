var fs = require('fs');
var httpGet = require('http-get');
var trail = require('path');
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

exports.downloadUrls = function(url){
  // fixme
  httpGet.get(url,trail.join(__dirname,"../..","data/sites",url),function(error,result){
    if (error){console.error(error);}
    else {console.log("File downloaded at: "+ result.file);}
  });
  return true; //use promises to return true when file has downloaded
};