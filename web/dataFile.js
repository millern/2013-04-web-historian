var fs = require('fs');
var trail = require('path');

var filePath = trail.join(__dirname,'..','data/sites.txt');
var dataHash = fs.existsSync(filePath) ? JSON.parse(fs.readFileSync(filePath,'utf8')) : {};
var id = 0;
exports.getData = function(key){
  return dataHash[key] || [];
};
exports.hasData = function(key){
  return dataHash.hasOwnProperty(key);
};
exports.setData = function(key,message) {
  message.createdAt = new Date();
  message.objectId = id++;
  if (dataHash.hasOwnProperty(key)){
    dataHash[key].push(message);
  } else {
    dataHash[key] = [message];
  }
  console.log(dataHash[key]);
  fs.writeFile(filePath,JSON.stringify(dataHash),"utf8",function(){
    console.log(JSON.stringify(dataHash));
  });
};