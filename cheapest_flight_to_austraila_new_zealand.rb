#! /usr/bin/ruby
require 'kayak_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_australia_new_zealand.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]

  airport_codes = [
                   [ "Auckland", "New Zealand", "AKL" ],
                   [ "Christchurh", "New Zealand", "CHC" ],
                   [ "Wellington", "New Zealand", "WLG" ],
                   [ "Adelaide", "Australia", "ADL" ],
                   [ "Brisbane", "Australia", "BNE" ],
                   [ "Cairns", "Australia", "CNS" ],
                   [ "Darwin", "Australia", "DRW" ],
                   [ "Melbourne", "Australia", "MEL" ],
                   [ "Perth", "Australia", "PER" ],
                   [ "Sydney", "Australia", "SYD" ]
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
