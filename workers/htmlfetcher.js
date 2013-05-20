var fs = require('fs');
var trail = require('path');
var htmlFetcher = require('./lib/html-fetcher-helpers.js');
var filePath = trail.join(__dirname,'..','data/sitesToDL.txt');

htmlFetcher.readUrls(filePath,function(url, date){
  htmlFetcher.downloadUrls(url, date);
});


