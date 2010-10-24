#! /usr/bin/ruby
require 'kayak_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_europe.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]

  airport_codes = [
                   [ "Vienna", "Austria", "VIE" ],
                   [ "Brussels", "Belgium", "BRU" ],
                   [ "Larnaca", "Cyprus", "LNA" ],                   
                   [ "Prague", "Czech Republic", "PRG"],
                   [ "Copenhagen", "Denmark", "CPH" ],
                   [ "Birmingham", "England", "BHX" ],
                   [ "London Gatwick", "England", "LGW" ],                   
                   [ "London Heathrow", "England", "LHR" ],
                   [ "Manchester", "England", "MAN" ],                   
                   [ "Helsinki", "Finland", "HEL" ],                   
                   [ "Nice", "France", "NCE" ],                   
                   [ "Paris", "France", "CDG" ],                   
                   [ "Strasbourg", "France", "SXB" ],
                   [ "Toulouse", "France", "TLS" ],
                   [ "Berlin", "Germany", "TXL" ],
                   [ "Cologne", "Germany", "CGN" ],        
                   [ "Dusseldorf", "Germany", "DUS" ],                   
                   [ "Frankfurt", "Germany", "FRA" ],                   
                   [ "Munich", "Germany", "MUC" ],                   
                   [ "Nurenberg", "Germany", "NUE" ],                   
                   [ "Stuttgart", "Germany", "STR" ],
                   [ "Athens", "Greece", "ATH" ],                   
                   [ "Budapest", "Hungary", "BUD" ],
                   [ "Dublin", "Ireland", "DUB" ],                
                   [ "Shannon", "Ireland", "SNN" ],
                   [ "Bologna", "Italy", "BLQ" ],                   
                   [ "Florence", "Italy", "FLR" ],                   
                   [ "Milan", "Italy", "MXP"],                   
                   [ "Rome", "Italy", "FCO" ],
                   [ "Turin", "Italy", "TRN" ],                   
                   [ "Venice", "Italy", "VCE" ],
                   [ "Riga", "Latvia", "RIX" ],                   
                   [ "Luxembourg", "Luxembourg", "LUX" ],                   
                   [ "Amsterdam", "Netherlands", "AMS" ],                   
                   [ "Oslo", "Norway", "OSL" ],                   
                   [ "Warsaw", "Poland", "WAW" ],                   
                   [ "Lisbon", "Portugal", "LIS" ],                   
                   [ "Bucharest", "Romania", "OTP" ],                   
                   [ "Glasgow", "Scotland", "GLA" ],                   
                   [ "Madrid", "Spain", "MAD" ],
                   [ "Malaga", "Spain", "AGP" ],                   
                   [ "Barcelona", "Spain", "BCN" ],
                   [ "Gothenburg", "Sweden", "GOT"],                   
                   [ "Stockholm", "Sweden", "ARN"],
                   [ "Basel", "Switzerland", "BSL"],
                   [ "Geneva", "Switzerland", "GVA" ],                       
                   [ "Zurich", "Switzerland", "ZRH" ],
                   [ "Istanbul", "Turkey", "IST" ]
                  ]

  airport_codes.each do |current_location|
    flight_search = KayakFlightSearch.new( kayak_api_key,
                                           'n',
                                           start_airport_code,
                                           current_location.last,
                                           start_date,
                                           end_date,
                                           num_travelers.to_i )

    flight_search.flight_search( true )
    cost, url, whole_elements = *flight_search.cheapest_flight
    puts "#{cost}, #{current_location[0]}, #{current_location[1]},#{current_location[2]}, http://api.kayak.com#{url}"
  end
  
  
end

