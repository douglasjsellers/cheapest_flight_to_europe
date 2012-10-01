#! /usr/bin/ruby
# -*- coding: utf-8 -*-
require_relative 'phantomjs_multi_destination_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_africa.rb START_AIRPORT_CODE START_DATE END_DATE"
else

  start_airport_code = ARGV[0]
  start_date = ARGV[1]
  end_date = ARGV[2]

  flight_search = MultiDestinationFlightSearch.new( start_airport_code, start_date, end_date )

  flight_search.add_destination("JNB","Johannesburg","South Africa")
  flight_search.add_destination("CAI","Cairo","Egypt")
  flight_search.add_destination("CPT","Cape Town","South Africa")
  flight_search.add_destination("SSH","Sharm el-Sheikh","Egypt")
  flight_search.add_destination("HRG","Hurghada","Egypt")
  flight_search.add_destination("CMN","Casablanca","Morocco")
  flight_search.add_destination("LOS","Lagos","Nigeria")
  flight_search.add_destination("NBO","Nairobi","Kenya")
  flight_search.add_destination("ALG","Algiers","Algeria")
  flight_search.add_destination("TUN","Tunis","Tunisia")
  flight_search.add_destination("MIR","Monastir","Tunisia")
  flight_search.add_destination("ADD","Addis Ababa","Ethiopia")
  flight_search.add_destination("ABV","Abuja","Nigeria")
  flight_search.add_destination("RAK","Marrakech","Morocco")
  flight_search.add_destination("DJE","Djerba","Tunisia")
  flight_search.add_destination("LAD","Luanda","Angola")
  flight_search.add_destination("MRU","Port Louis","Mauritius")
  flight_search.add_destination("KRT","Khartoum","Sudan")
  flight_search.add_destination("LXR","Luxor","Egypt")
  flight_search.add_destination("DUR","Durdan","South Africa")
  
  flight_search.print_cheapest_flights
  
  
end

