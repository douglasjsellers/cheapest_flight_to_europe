#! /usr/bin/ruby
require 'kayak_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_europe.rb START_DATE END_DATE NUM_TRAVELERS"
else

  start_date = ARGV[0]
  end_date = ARGV[1]
  num_travelers = ARGV[2]

  airport_codes = [
                   [ "Vienna", "Austria", "VIE" ],
                   [ "Brussels", "Belgium", "BRU" ],
                   [ "Prague", "Czech Republic", "PRG"],
                   [ "Copenhagen", "Denmark", "CPH" ],
                   [ "Birmingham", "England", "BHX" ],
                   [ "Istanbul", "Turkey", "IST" ],
                   [ "Zurich", "Switzerland", "ZRH" ],
                   [ "Geneva", "Switzerland", "GVA" ],
                   [ "Stockholm", "Sweden", "ARN"],
                   [ "Madrid", "Spain", "MAD" ],
                   [ "Barcelona", "Spain", "BCN" ],
                   [ "Glasgow", "Scotland", "GLA" ],
                   [ "Bucharest", "Romania", "OTP" ],
                   [ "Lisbon", "Portugal", "LIS" ],
                   [ "Warsaw", "Poland", "WAW" ],
                   [ "Oslo", "Norway", "OSL" ],
                   [ "Amsterdam", "Netherlands", "AMS" ],
                   [ "Luxembourg", "Luxembourg", "LUX" ],
                   [ "Venice", "Italy", "VCE" ],
                   [ "Rome", "Italy", "FCO" ],
                   [ "Milan", "Italy", "MXP"],
                   [ "Florence", "Italy", "FLR" ],
                   [ "Bologna", "Italy", "BLQ" ],
                   [ "Budapest", "Hungary", "BUD" ],
                   [ "Stuttgart", "Germany", "STR" ],
                   [ "Nurenberg", "Germany", "NUE" ],
                   [ "Munich", "Germany", "MUC" ],
                   [ "Frankfurt", "Germany", "FRA" ],
                   [ "London Heathrow", "England", "LHR" ],
                   [ "Berlin", "Germany", "TXL" ],
                   [ "Toulouse", "France", "TLS" ],
                   [ "Strasbourg", "France", "SXB" ],
                   [ "Paris", "France", "CDG" ],
                   [ "Nice", "France", "NCE" ],
                   [ "Helsinki", "Finland", "HEL" ],
                   [ "Dusseldorf", "Germany", "DUS" ],
                   [ "Cologne", "Germany", "CGN" ],                   
                   [ "Shannon", "Ireland", "SNN" ],
                   [ "Dublin", "Ireland", "DUB" ],                   
                   [ "Manchester", "England", "MAN" ],
                   [ "London Gatwick", "England", "LGW" ],
                   [ "Turin", "Italy", "TRN" ],
                   [ "Gothenburg", "Sweden", "GOT"],
                   [ "Basel", "Switzerland", "BSL"],
                   [ "Malaga", "Spain", "AGP" ]
                  ]

  extras = [
            [ "Larnaca", "Cyprus", "LNA" ],
            [ "Riga", "Latvia", "RIX" ],
           ]

  airport_codes.each do |current_location|
    flight_search = KayakFlightSearch.new( 'XlTLRouSZWMUuk0NlXRjMw',
                                           'n',
                                           'LAX',
                                           current_location.last,
                                           start_date,
                                           end_date,
                                           num_travelers.to_i )

    flight_search.flight_search( true )
    cost, url, whole_elements = *flight_search.cheapest_flight
    puts "#{cost}, #{current_location[1]}, #{current_location[2]}, #{url}"
  end
  
  
end

