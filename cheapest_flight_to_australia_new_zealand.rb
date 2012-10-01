#! /usr/bin/ruby
require_relative 'phantomjs_multi_destination_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_australia_new_zealand.rb  START_AIRPORT_CODE START_DATE END_DATE"
else

  start_airport_code = ARGV[0]
  start_date = ARGV[1]
  end_date = ARGV[2]

  flight_search = MultiDestinationFlightSearch.new( start_airport_code, start_date, end_date )

  flight_search.add_destination( "SYD","Sydney","Australia" )
  flight_search.add_destination( "MEL","Melbourne","Australia" )
  flight_search.add_destination( "BNE","Brisbane","Australia" )
  flight_search.add_destination( "PER","Perth","Australia" )
  flight_search.add_destination( "ADL","Adelaide","Australia" )
  flight_search.add_destination( "OOL","Gold Coast","Australia")
  flight_search.add_destination( "CNS","Cairns","Australia" )
  flight_search.add_destination( "CBR","Canberra","Australia")
  flight_search.add_destination( "HBA","Hobart","Australia")
  flight_search.add_destination( "DRW","Darwin","Australia" )
  flight_search.add_destination( "TSV","Townsville","Australia" )
  flight_search.add_destination( "LST","Tasmania","Australia" )
  flight_search.add_destination( "NTL","Newcastle","Australia" )
  

  
  flight_search.add_destination( "AKL","Auckland","New Zealand")
  flight_search.add_destination( "CHC","Christchurh","New Zealand")
  flight_search.add_destination( "WLG","Wellington","New Zealand")
  flight_search.add_destination( "ZQN","Queenstown","New Zealand")
  flight_search.add_destination( "DUD","Dudedin","New Zealand")
  flight_search.add_destination( "GUM","Guam","Guam")
  flight_search.add_destination( "NAN","Fiji","Fiji")
  flight_search.add_destination( "PPT","Papeete","Tahiti")
  flight_search.add_destination( "BOB","Bora Bora","Tahiti")
  flight_search.add_destination( "MOZ","Moorea","Tahiti")







  
  flight_search.print_cheapest_flights   
  
end
