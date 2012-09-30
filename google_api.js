var slug  = phantom.args[0];

var airports_to_process = new Array();

airports_to_process.push( ["http://www.google.com/flights/#search;f=LAX,LGB,SNA,BUR,ONT;t=TLS;d=2012-12-04;r=2012-12-19", "TLS", "Toulouse", "France"] );
airports_to_process.push( ["http://www.google.com/flights/#search;f=LAX,LGB,SNA,BUR,ONT;t=SXB;d=2012-12-04;r=2012-12-19", "SXB","Strasbourg","France"] );
airports_to_process.push( ["http://www.google.com/flights/#search;f=LAX,LGB,SNA,BUR,ONT;t=VIE;d=2012-12-04;r=2012-12-19", "VIE", "Vienna", "Austria"] );

var times = [];
var startTime = new Date().getTime();

function loadNext()
{

  if( airports_to_process.length == 0 || ( new Date().getTime() - startTime ) > 600000 )
  {
      phantom.exit();
  }else
  {
    processAirport( airports_to_process.pop() );
  }
}

function processAirport( airport_array )
{
  var url = airport_array[0];
  var start = new Date().getTime();

  var page = require('webpage').create();
  page.open(url, function() { 
              function get_cheapest_price( count )
              {
                

              page.render( airport_array[1] + ".png" );
              var cheapest_ticket = page.evaluate( function() {
                   var parent_table = document.evaluate(
                     '//*[@id="root"]/table/tbody/tr/td/table/tbody/tr/td[2]/div/div[1]/div[3]/div[1]/div/div[2]',
                     document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null
                   );                                                     
                   if( parent_table.snapshotLength > 0 )
                   {
                       
                     var result = document.evaluate(
                       '//*[@id="root"]/table/tbody/tr/td/table/tbody/tr/td[2]/div/div[1]/div[3]/div[1]/div/div[2]/div[2]/div[1]/div[1]/div/div/div[6]/span[2]',
                     document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null
                   );
                   
                     return result.snapshotItem(0).innerText;
                   } else
                     {
                       return 0;
                     }
                 } );
                if( cheapest_ticket != 0 )
                {
                    console.log( cheapest_ticket + "," + airport_array[2] + " - " + airport_array[3] +  "," + url );
                    loadNext();
                } else if( count > 20 )
                {
                    loadNext();
                } else
                {
                    setTimeout(function(){ get_cheapest_price( count + 1); },200);
                }
              }
              get_cheapest_price( 0 );
  } );
}



loadNext();



