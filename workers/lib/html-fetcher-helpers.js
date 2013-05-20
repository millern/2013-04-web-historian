var fs = require('fs');
var httpGet = require('http-get');
var trail = require('path');
var promised = require('promised-io');

exports.readUrls = function(filePath, cb){
  var urlHash;
  var file = fs.readFile(filePath, 'utf8', function(error,data){
    console.log("Here is the data " + data);
    if(data){
    urlHash = JSON.parse(data);
    console.log("Here is the parsed data " + urlHash);
    var returnArray = [];
    for(var key in urlHash){
      cb(key,urlHash[key][0]);
      console.log(urlHash[key][0]); //if we have duplicate websites, just take the first one
    }
    fs.writeFile(filePath,"",function(error){
      if (error) throw error;
    console.log("File overwritten");
    });
    } else {
      console.log("Nothing to write");
    }
  });
};

exports.downloadUrls = function(url, date){
  if(!fs.existsSync(trail.join(__dirname,"../..","data/sites",url))){
    fs.mkdir(trail.join(__dirname,"../..","data/sites",url));
  }
  httpGet.get(url,trail.join(__dirname,"../..","data/sites",url,date),function(error,result){
    if (error){console.error(error);}
    else {console.log("File downloaded at: "+ result.file);}
  });
};