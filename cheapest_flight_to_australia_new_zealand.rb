#! /usr/bin/ruby
require 'multi_destination_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_australia_new_zealand.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]

  flight_search = MultiDestinationFlightSearch.new( kayak_api_key, start_airport_code, start_date, end_date, num_travelers )

  flight_search.add_destination( "AKL","Auckland","New Zealand")
  flight_search.add_destination( "CHC","Christchurh","New Zealand")
  flight_search.add_destination( "WLG","Wellington","New Zealand")
  flight_search.add_destination( "ADL","Adelaide","Australia" )
  flight_search.add_destination( "BNE","Brisbane","Australia" )
  flight_search.add_destination( "CNS","Cairns","Australia" )
  flight_search.add_destination( "DRW","Darwin","Australia" )
  flight_search.add_destination( "MEL","Melbourne","Australia" )
  flight_search.add_destination( "PER","Perth","Australia" )
  flight_search.add_destination( "SYD","Sydney","Australia" )
  
  flight_search.print_cheapest_flights   
  
end
