// eventually, you'll have some code here that uses the tested helpers 
// to actually download the urls you want to download.
var htmlFetcher = require('./lib/html-fetcher-helpers.js');
console.log("running app");
htmlFetcher.downloadUrls("www.craigslist.org");
console.log("downloaded urls");