#! /usr/bin/ruby
require 'kayak_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_asia.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]

  airport_codes = [
                   [ "Bagkok", "Thailand", "BKK" ],
                   [ "Beijing", "China", "PEK" ],
                   [ "Mumbai", "India", "BOM" ],
                   [ "Colombo", "Sri Lanka", "CMB" ],
                   [ "Hanoi", "Vietnam", "HAN" ],
                   [ "Ho Chi Minh City", "Vietnam", "SGN" ],
                   [ "Da Nang", "Vietnam", "DAD" ],
                   [ "Hiroshima", "Japan", "HIW" ],
                   [ "Hong Kong", "China", "HKG" ],
                   [ "Jakarta", "Indonesia", "CGK" ],
                   [ "Manila", "Philippines", "MNL" ],
                   [ "Nagoya", "Japan", "NGO" ],
                   [ "Osaka", "Japan", "KIX" ],
                   [ "Sapporo", "Japan", "CTS" ],
                   [ "Seoul", "Korea", "SEL" ],
                   [ "Singapore", "Singapore", "SIN" ],
                   [ "Taipei", "Taiwan", "TPE" ],
                   [ "Tokyo", "Japan", "NRT" ],
                   [ "Xian Xianyang", "China", "XIY" ],
                   [ "Dhaka", "Bangladesh", "DAC" ],
                   [ "Shanghai", "China", "PVG" ],
                   [ "Guangzhou", "China", "CAN" ],
                   [ "Central", "Japan", "NGO" ],
                   [ "Kuala Lumpur", "Malaysia", "KUL" ],
                   [ "Penang", "Malaysia", "PEN" ],
                   [ "Islamabad", "Pakistan", "ISB" ],
                   [ "Karachi", "Pakistan", "KHI" ],
                   [ "Jinnah", "Pakistan", "JIA" ],
                   [ "Seoul", "Korea", "GMP" ],
                   [ "Bangkok", "Thailand", "DMK" ],
                   [ "Phuket", "Thailand", "HKT" ],
                   [ "Amritsar", "India", "ATQ" ],
                   [ "New Delhi", "India", "DEL" ],
                   [ "Kolkata", "India", "CCU" ],
                   [ "Hyderabad", "India", "HYD" ],
                   [ "Goa", "India", "GOI" ],
                   [ "Madras", "India", "MAA" ],
                   [ "Bangalore", "India", "BLR" ], 
                   [ "Trivandrum", "India", "TRV" ],
                   [ "Kozhikode", "India", "CCJ" ],
                   [ "Kochi", "India", "COK" ],
                   [ "Wattay", "Laos", "VTE" ],
                   [ "Luang Prabang", "Laos", "LPQ"],
                   [ "Pakse", "Laos", "PKZ" ],
                   [ "Phnom Penh", "Cambodia", "PNH" ],
                   [ "Reap", "Cambodia", "REP" ],
                   [ "Paro", "Butan", "PBH" ],
                   [ "Kathmandu", "Nepal", "KTM" ],
                   [ "Manila", "Philippines", "MNL" ],
                   [ "Lapu-Lapu", "Philippines", "CEB" ],
                   [ "Davao", "Philippines", "DVO" ]
                   
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

