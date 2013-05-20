var stubs = require("./helpers/stubs");
var htmlFetcherHelpers = require("../workers/lib/html-fetcher-helpers");
var fs = require("fs");

describe("html fetcher helpers", function(){

  it("should have a 'readUrls' function", function(){
    var urlArray = ["example1.com", "example2.com"];

    fs.writeFileSync(__dirname + "/testdata/sites.txt", JSON.stringify({"example1.com":true,"example2.com":true}));

    var resultArray = [];
    var result = htmlFetcherHelpers.readUrls(__dirname + "/testdata/sites.txt", function(urls){
      resultArray.push(urls);
    });

    waits(200);
    runs(function(){
      expect(resultArray).toEqual(urlArray);
    });
  });
});