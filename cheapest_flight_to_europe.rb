#! /usr/bin/ruby
require 'multi_destination_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_europe.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]

  flight_search = MultiDestinationFlightSearch.new( kayak_api_key, start_airport_code, start_date, end_date, num_travelers )

  flight_search.add_destination( "VIE", "Vienna", "Austria" )
  flight_search.add_destination( "BRU", "Brussels", "Belgium" )
  flight_search.add_destination( "LNA",  "Larnaca", "Cyprus" )            
  flight_search.add_destination( "PRG", "Prague", "Czech Republic" )
  flight_search.add_destination( "CPH", "Copenhagen", "Denmark" )
  flight_search.add_destination( "BHX","Birmingham","England")
  flight_search.add_destination( "LGW", "LondonGatwick", "England")
  flight_search.add_destination( "LHR", "LondonHeathrow", "England")
  flight_search.add_destination( "MAN","Manchester","England")
  flight_search.add_destination( "HEL","Helsinki","Finland")
  flight_search.add_destination( "NCE","Nice","France")
  flight_search.add_destination( "CDG","Paris","France")
  flight_search.add_destination( "SXB","Strasbourg","France")
  flight_search.add_destination( "TLS","Toulouse","France")
  flight_search.add_destination( "TXL","Berlin","Germany")
  flight_search.add_destination( "CGN","Cologne","Germany")
  flight_search.add_destination( "DUS","Dusseldorf","Germany")
  flight_search.add_destination( "FRA","Frankfurt","Germany")
  flight_search.add_destination( "MUC","Munich","Germany")
  flight_search.add_destination( "NUE","Nurenberg","Germany")
  flight_search.add_destination( "STR","Stuttgart","Germany")
  flight_search.add_destination( "ATH","Athens","Greece")
  flight_search.add_destination( "BUD","Budapest","Hungary")
  flight_search.add_destination( "DUB","Dublin","Ireland")
  flight_search.add_destination( "SNN","Shannon","Ireland")
  flight_search.add_destination( "BLQ","Bologna","Italy")
  flight_search.add_destination( "FLR","Florence","Italy")
  flight_search.add_destination( "MXP","Milan","Italy")
  flight_search.add_destination( "FCO","Rome","Italy")
  flight_search.add_destination( "TRN","Turin","Italy")
  flight_search.add_destination( "VCE","Venice","Italy")
  flight_search.add_destination( "RIX","Riga","Latvia")
  flight_search.add_destination( "LUX","Luxembourg","Luxembourg")
  flight_search.add_destination( "AMS","Amsterdam","Netherlands")
  flight_search.add_destination( "OSL","Oslo","Norway")
  flight_search.add_destination( "WAW","Warsaw","Poland")
  flight_search.add_destination( "LIS","Lisbon","Portugal")
  flight_search.add_destination( "OTP","Bucharest","Romania")
  flight_search.add_destination( "GLA","Glasgow","Scotland")
  flight_search.add_destination( "MAD","Madrid","Spain")
  flight_search.add_destination( "AGP","Malaga","Spain")
  flight_search.add_destination( "BCN","Barcelona","Spain")
  flight_search.add_destination( "GOT","Gothenburg","Sweden")
  flight_search.add_destination( "ARN","Stockholm","Sweden")
  flight_search.add_destination( "BSL","Basel","Switzerland")
  flight_search.add_destination( "GVA","Geneva","Switzerland")
  flight_search.add_destination( "ZRH","Zurich","Switzerland")
  flight_search.add_destination( "IST","Istanbul","Turkey")
  
  flight_search.print_cheapest_flights
  
end

