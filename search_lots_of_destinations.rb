#! /usr/bin/ruby
require 'kayak_flight_search'


flight_search = KayakFlightSearch.new( 'XlTLRouSZWMUuk0NlXRjMw',
                                       'n',
                                       'LAX',
                                       'LHR',
                                       '12/18/2010',
                                       '1/1/2011',
                                       1 )

flight_search.flight_search( false )

cost, url, whole_elements = *flight_search.cheapest_flight

puts "Lowest cost: #{cost}, #{url}"
