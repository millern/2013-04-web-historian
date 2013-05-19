// eventually, you'll have some code here that uses the tested helpers 
// to actually download the urls you want to download.
var fs = require('fs');
var trail = require('path');
var htmlFetcher = require('./lib/html-fetcher-helpers.js');
var filePath = trail.join(__dirname,'..','data/sitesToDL.txt');

htmlFetcher.readUrls(filePath,function(url, date){
  console.log("reading urls from :",filePath);
  htmlFetcher.downloadUrls(url, date);
});


