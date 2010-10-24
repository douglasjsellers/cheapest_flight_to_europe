#! /usr/bin/ruby
require 'kayak_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_europe.rb START_DATE END_DATE NUM_TRAVELERS"
else

  start_date = ARGV[0]
  end_date = ARGV[1]
  num_travelers = ARGV[2]
  
  flight_search = KayakFlightSearch.new( 'XlTLRouSZWMUuk0NlXRjMw',
                                         'n',
                                         'LAX',
                                         'LHR',
                                         start_date,
                                         end_date,
                                         num_travelers.to_i )

  flight_search.flight_search( false )

  cost, url, whole_elements = *flight_search.cheapest_flight

  puts "Lowest cost: #{cost}, #{url}"
end

