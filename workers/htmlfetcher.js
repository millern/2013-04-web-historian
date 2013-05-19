// eventually, you'll have some code here that uses the tested helpers 
// to actually download the urls you want to download.
var trail = require('path');
var htmlFetcher = require('./lib/html-fetcher-helpers.js');
console.log("running app");
var filePath = trail.join(__dirname,'..','data/sites.txt');
htmlFetcher.readUrls(filePath,function(url){
  htmlFetcher.downloadUrls(url);
  console.log("downloaded from "+url);
});
console.log("downloaded urls");