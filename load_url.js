var url  = phantom.args[0];
var page = require('webpage').create();
page.open(url, function (status) {});
page.onLoadFinished = function (status)
{
  var cheapest_ticket = page.evaluate( function() {
                   

                   var result = document.evaluate(
                     '//*[@id="root"]/table/tbody/tr/td/table/tbody/tr/td[2]/div/div[1]/div[3]/div[1]/div/div[2]/div[2]/div[1]/div[1]/div/div/div[6]/span[2]',
                     document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null
                   );
                   return result.snapshotItem(0).innerText;
                 } );
  console.log( cheapest_ticket );
  phantom.exit();
};

page.onLoadFinished = function (status)
{
  phantom.exit();
}