var fs = require('fs');
var trail = require('path');

var filePath = trail.join(__dirname,'..','data/sites.txt');
var dlFilePath = trail.join(__dirname,'..','data/sitesToDL.txt');
var dataHash = fs.existsSync(filePath) ? JSON.parse(fs.readFileSync(filePath,'utf8')) : {};
exports.getData = function(key){
  return dataHash[key] || [];
};
exports.hasData = function(key){
  return dataHash.hasOwnProperty(key);
};
exports.setData = function(key,message) {
  if (dataHash.hasOwnProperty(key)){
    dataHash[key].push(message);
  } else {
    dataHash[key] = [message];
  }
  var dlHash = fs.existsSync(dlFilePath) && fs.readFileSync(dlFilePath,'utf8') ? JSON.parse(fs.readFileSync(dlFilePath,'utf8')) : {};
  if (dlHash.hasOwnProperty(key)){
    dlHash[key].push(message);
  } else {
    dlHash[key] = [message];
  }
  fs.writeFile(filePath,JSON.stringify(dataHash),"utf8",function(){
    console.log(JSON.stringify(dataHash));
  });
  fs.writeFile(dlFilePath,JSON.stringify(dlHash),"utf8",function(){
    console.log(JSON.stringify(dlHash));
  });
};