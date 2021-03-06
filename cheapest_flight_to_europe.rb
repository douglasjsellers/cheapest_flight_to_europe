#! /usr/bin/ruby
# -*- coding: utf-8 -*-
require_relative 'phantomjs_multi_destination_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_europe.rb START_AIRPORT_CODE START_DATE END_DATE"
else

  start_airport_code = ARGV[0]
  start_date = ARGV[1]
  end_date = ARGV[2]

  flight_search = MultiDestinationFlightSearch.new( start_airport_code, start_date, end_date )

  flight_search.add_destination( "LHR", "LondonHeathrow", "England")
  flight_search.add_destination( "CDG","Paris","France")
  flight_search.add_destination( "FRA","Frankfurt","Germany")
  flight_search.add_destination( "AMS","Amsterdam","Netherlands")
  flight_search.add_destination( "MAD","Madrid","Spain")
  flight_search.add_destination( "MUC","Munich","Germany")
  flight_search.add_destination( "FCO","Rome","Italy")
  flight_search.add_destination( "BCN","Barcelona","Spain")  
  flight_search.add_destination( "LGW", "LondonGatwick", "England")
  flight_search.add_destination( "ORY", "Paris", "France" )
  flight_search.add_destination( "DME", "Moscow", "Russia" )
  flight_search.add_destination( "AYT", "Antalya", "Turkey" )
  flight_search.add_destination( "ZRH","Zurich","Switzerland")
  flight_search.add_destination( "PMI", "Palma de Mallorca", "Spain" )
  flight_search.add_destination( "CPH", "Copenhagen", "Denmark" )
  flight_search.add_destination( "SVO", "Moscow", "Russia" )
  flight_search.add_destination( "VIE", "Vienna", "Austria" )
  flight_search.add_destination( "OSL","Oslo","Norway")
  flight_search.add_destination( "DUS","Dusseldorf","Germany")  
  flight_search.add_destination( "MXP","Milan","Italy")
  flight_search.add_destination( "ARN","Stockholm","Sweden")
  flight_search.add_destination( "MAN","Manchester","England")
  flight_search.add_destination( "BRU", "Brussels", "Belgium" )  
  flight_search.add_destination( "DUB","Dublin","Ireland")
  flight_search.add_destination( "STN",  "London", "England" )            
  flight_search.add_destination( "TXL","Berlin","Germany")  
  flight_search.add_destination( "HEL","Helsinki","Finland")
  flight_search.add_destination( "LIS","Lisbon","Portugal")
  flight_search.add_destination( "ATH","Athens","Greece")  
  flight_search.add_destination( "HAM",  "Hamburg", "Germany" )            
  flight_search.add_destination( "GVA","Geneva","Switzerland")
  flight_search.add_destination( "AGP","Malaga","Spain")
  flight_search.add_destination( "SAW",  "Istanbul", "Turkey" )            
  flight_search.add_destination( "PRG", "Prague", "Czech Republic" )
  flight_search.add_destination( "LPA",  "Las Palmas de Gran Canaria", "Spain" )            
  flight_search.add_destination( "NCE","Nice","France")  
  flight_search.add_destination( "ALC",  "Alicante", "Spain" )            
  flight_search.add_destination( "CGN","Cologne","Germany")
  flight_search.add_destination( "LED",  "St. Petersburg", "Russia" )            
  flight_search.add_destination( "STR","Stuttgart","Germany")
  flight_search.add_destination( "LTN",  "London", "England" )            
  flight_search.add_destination( "EDI",  "Edinburgh", "UK" )            
  flight_search.add_destination( "WAW","Warsaw","Poland")
  flight_search.add_destination( "LIN",  "Milan", "Italy" )            
  flight_search.add_destination( "BUD","Budapest","Hungary")
  flight_search.add_destination( "TFS",  "Santa Cruz de Tenerife", "Spain" )            
  flight_search.add_destination( "BHX","Birmingham","England")  
  flight_search.add_destination( "VCE","Venice","Italy")  
  flight_search.add_destination( "ADB",  "Izmir", "Turkey" )            
  flight_search.add_destination( "ESB",  "Ankara", "Turkey" )            
  flight_search.add_destination( "LYS",  "Lyon", "France" )            
  flight_search.add_destination( "BGY",  "Milan", "Italy" )            
  flight_search.add_destination( "VKO",  "Moscow", "Russia" )            
  flight_search.add_destination( "KBP",  "Kiev", "Russia" )            
  flight_search.add_destination( "MRS",  "Marseille", "France" )            
  flight_search.add_destination( "SXF",  "Berlin", "Germany" )            
  flight_search.add_destination( "TLS","Toulouse","France")
  flight_search.add_destination( "GLA","Glasgow","UK")
  flight_search.add_destination( "CTA",  "Catania", "Italy" )            
  flight_search.add_destination( "OPO",  "Porto", "Portugal" )            
  flight_search.add_destination( "CRL",  "Charleroi", "Belgium" )            
  flight_search.add_destination( "BLQ","Bologna","Italy")
  flight_search.add_destination( "BRS",  "Bristol", "UK" )            
  flight_search.add_destination( "NAP",  "Naples", "Italy" )            
  flight_search.add_destination( "IBZ",  "Ibiza", "Spain" )            
  flight_search.add_destination( "FAO",  "Faro", "Portugal" )            
  flight_search.add_destination( "BGO",  "Bergen", "Norway" )            
  flight_search.add_destination( "ACE",  "Lanzarote", "Spain" )            
  flight_search.add_destination( "LCA",  "Larnaca", "Cyprus" )            
  flight_search.add_destination( "HAJ","Hanover","Germany")
  flight_search.add_destination( "HER","Heraklion","Greece")
  flight_search.add_destination( "LPL","Liverpool","UK")
  flight_search.add_destination( "RIX","Riga","Latvia")
  flight_search.add_destination( "BSL","Basel","Switzerland")
  flight_search.add_destination( "OTP","Bucharest","Romania")  
  flight_search.add_destination( "PMO","Palermo","Italy")
  flight_search.add_destination( "VLC","Valencia","Spain")
  flight_search.add_destination( "SVQ","Seville","Spain")
  flight_search.add_destination( "FUE","Puerto del Rosario","Spain")
  flight_search.add_destination( "GOT","Gothenburg","Sweden")
  flight_search.add_destination( "CIA","Rome","Italy")
  flight_search.add_destination( "PSA","Pisa","Italy")
  flight_search.add_destination( "NCL","Newcastle upon Tyne","UK")
  flight_search.add_destination( "EMA","Derby","UK")
  flight_search.add_destination( "RHO","Rhodes","Greece")
  flight_search.add_destination( "SVG","Stavanger","Norway")
  flight_search.add_destination( "BOD","Bordeaux","France")
  flight_search.add_destination( "BFS","Belfast","Ireland")
  flight_search.add_destination( "TFN","Tenerife","Spain")
  flight_search.add_destination( "SKG","Thessaloniki","Greece")
  flight_search.add_destination( "BIO","Bilbao","Spain")
  flight_search.add_destination( "NUE","Nurenberg","Germany")
  flight_search.add_destination( "TRD","Trondheim","Norway")
  flight_search.add_destination( "DLM","Muğla","Turkey")
  flight_search.add_destination( "BRI","Bari","Italy")
  flight_search.add_destination( "TRN","Turin","Italy")  
  flight_search.add_destination( "CAG","Cagliari","Italy")
  flight_search.add_destination( "MLA","Malta","Malta")
  flight_search.add_destination( "LUX","Luxembourg","Luxembourg")
  flight_search.add_destination( "FLR","Florence","Italy")
  flight_search.add_destination( "IST","Istanbul","Turkey")  
  flight_search.add_destination( "SXB","Strasbourg","France")
  flight_search.add_destination( "SNN","Shannon","Ireland")
  
  flight_search.print_cheapest_flights
  
end

