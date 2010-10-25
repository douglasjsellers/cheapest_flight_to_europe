#! /usr/bin/ruby
require 'multi_destination_flight_search'


if( ARGV.length < 5 )
  puts "ruby cheapest_flight_to_asia.rb KAYAK_API_KEY START_AIRPORT_CODE START_DATE END_DATE NUM_TRAVELERS"
else

  kayak_api_key = ARGV[0]
  start_airport_code = ARGV[1]
  start_date = ARGV[2]
  end_date = ARGV[3]
  num_travelers = ARGV[4]
  flight_search = MultiDestinationFlightSearch.new( kayak_api_key, start_airport_code, start_date, end_date, num_travelers )

  flight_search.add_destination( "BKK","Bagkok","Thailand")
  flight_search.add_destination( "PEK","Beijing","China")
  flight_search.add_destination( "BOM","Mumbai","India")
  flight_search.add_destination( "CMB","Colombo","Sri Lanka" )
  flight_search.add_destination( "HAN","Hanoi","Vietnam")
  flight_search.add_destination( "SGN", "Ho Chi Minh City", "Vietnam" )
  flight_search.add_destination( "DAD", "Da Nang", "Vietnam")
  flight_search.add_destination( "HIW","Hiroshima","Japan")
  flight_search.add_destination( "HGK", "Hong Kong", "China")
  flight_search.add_destination( "CGK","Jakarta","Indonesia")
  flight_search.add_destination( "MNL","Manila","Philippines")
  flight_search.add_destination( "NGO","Nagoya","Japan")
  flight_search.add_destination( "KIX","Osaka","Japan")
  flight_search.add_destination( "CTS","Sapporo","Japan")
  flight_search.add_destination( "SEL","Seoul","Korea")
  flight_search.add_destination( "SIN","Singapore","Singapore")
  flight_search.add_destination( "TPE","Taipei","Taiwan")
  flight_search.add_destination( "NRT","Tokyo","Japan")
  flight_search.add_destination( "XIY", "Xian Xianyang", "China")
  flight_search.add_destination( "DAC","Dhaka","Bangladesh")
  flight_search.add_destination( "PVG","Shanghai","China")
  flight_search.add_destination( "CAN","Guangzhou","China")
  flight_search.add_destination( "NGO","Central","Japan")
  flight_search.add_destination( "KUL","Kuala Lumpur", "Malaysia")
  flight_search.add_destination( "PEN","Penang","Malaysia")
  flight_search.add_destination( "ISB","Islamabad","Pakistan")
  flight_search.add_destination( "KHI","Karachi","Pakistan")
  flight_search.add_destination( "JIA","Jinnah","Pakistan")
  flight_search.add_destination( "GMP","Seoul","Korea")
  flight_search.add_destination( "DMK","Bangkok","Thailand")
  flight_search.add_destination( "HKT","Phuket","Thailand")
  flight_search.add_destination( "ATQ","Amritsar","India")
  flight_search.add_destination( "DEL", "New Delhi", "India")
  flight_search.add_destination( "CCU","Kolkata","India")
  flight_search.add_destination( "HYD","Hyderabad","India")
  flight_search.add_destination( "GOI","Goa","India")
  flight_search.add_destination( "MAA","Madras","India")
  flight_search.add_destination( "BLR","Bangalore","India")
  flight_search.add_destination( "TRV","Trivandrum","India")
  flight_search.add_destination( "CCJ","Kozhikode","India")
  flight_search.add_destination( "COK","Kochi","India")
  flight_search.add_destination( "VTE","Wattay","Laos")
  flight_search.add_destination( "LPQ", "Luang Prabang", "Laos")
  flight_search.add_destination( "PKZ","Pakse","Laos")
  flight_search.add_destination( "PNH", "Phnom Penh","Cambodia")
  flight_search.add_destination( "REP","Reap","Cambodia")
  flight_search.add_destination( "PBH","Paro","Butan")
  flight_search.add_destination( "KTM","Kathmandu","Nepal")
  flight_search.add_destination( "MNL","Manila","Philippines")
  flight_search.add_destination( "CEB","Lapu-Lapu","Philippines")
  flight_search.add_destination( "DVO","Davao","Philippines")
  
  flight_search.print_cheapest_flights
  
  
end

