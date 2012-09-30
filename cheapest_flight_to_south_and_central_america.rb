#! /usr/bin/ruby
require_relative 'phantomjs_multi_destination_flight_search'


if( ARGV.length < 3 )
  puts "ruby cheapest_flight_to_south_and_central_america.rb START_AIRPORT_CODE START_DATE END_DATE"
else

  start_airport_code = ARGV[0]
  start_date = ARGV[1]
  end_date = ARGV[2]

  flight_search = MultiDestinationFlightSearch.new( start_airport_code, start_date, end_date )

  flight_search.add_destination( "PTY","Panama City","Panama")
  flight_search.add_destination( "SJO","San Jose","Costa Rica")
  flight_search.add_destination( "SAL","San Salvador","El Salvador")
  flight_search.add_destination( "GUA","Guatemala City","Guatemala")
  flight_search.add_destination( "MGA","Managua","Nicaragua")
  flight_search.add_destination( "SAP","San Pedro Sula","Honduras")
  flight_search.add_destination( "TGU","Tegucigalpa","Honduras")
  flight_search.add_destination( "LIR","Liberia","Costa Rica")
  flight_search.add_destination( "PAC","Panama City","Panama")
  flight_search.add_destination( "RTB","Roatan","Honduras")
  flight_search.add_destination( "LCE","La Ceiba","Honduras")
  flight_search.add_destination( "BZE","Belize City","Belize")
  flight_search.add_destination( "GRU","Sao Paulo","Brazil")
  flight_search.add_destination( "BOG","Bogota","Columbia")
  flight_search.add_destination( "CGH","Sao Paulo","Brazil")
  flight_search.add_destination( "BSB","Brasilia","Brazil")
  flight_search.add_destination( "GIG","Rio de Janeiro","Brazil")
  flight_search.add_destination( "SCL","Santiago","Chile")
  flight_search.add_destination( "LIM","Lima","Peru")
  flight_search.add_destination( "CCS","Caracas","Venezula")
  flight_search.add_destination( "UIO","Quito","Ecuador")
  flight_search.add_destination( "EZE","Buenos Aires","Argentina")
  flight_search.add_destination( "SDU","Rio de Janeiro","Brazil")
  flight_search.add_destination( "SSA","Salvador","Brazil")
  flight_search.add_destination( "AEP","Buenos Aires","Argentina")
  flight_search.add_destination( "CNF","Belo Horizonte","Brazil")
  flight_search.add_destination( "POA","Porto Alegre","Brazil")

  flight_search.add_destination( "VVI","Santa Cruz","Bolivia")
  flight_search.add_destination( "LPB","La Paz","Bolivia")
  flight_search.add_destination( "SRE","Sucre","Bolivia")
  flight_search.add_destination( "CBB","Cochabamba","Bolivia")
  flight_search.add_destination( "TJA","Tarija","Bolivia")
  flight_search.add_destination( "MDZ","Mendoza","Argentina")
  flight_search.add_destination( "COR","Cordoba","Argentina")
  flight_search.add_destination( "IGR","Puerto Iguazu","Argentina")
  flight_search.add_destination( "PUQ","Punta Arenas","Chile")
  flight_search.add_destination( "IPC","Easter Island","Chile")
  flight_search.add_destination( "GYE","Guayaquil","Ecuador")
  flight_search.add_destination( "GPS","Galapagos Islands","Ecuador")
  flight_search.add_destination( "MPN","Mount Pleasant","Faulkland Islands")
  flight_search.add_destination( "CAY","Cayenne","French Guiana")
  flight_search.add_destination( "GEO","Georgetown","Guyana")
  flight_search.add_destination( "ASU","Asuncion","Paraguay")
  flight_search.add_destination( "CUZ","Cuzco","Peru")
  flight_search.add_destination( "PBM","Paramaribo","Suriname")
  flight_search.add_destination( "MVD","Montevideo","Uruguay")
  flight_search.add_destination( "PDP","Punta Del Este","Uruguay")
  flight_search.add_destination( "VLN","Valencia","Venezula")
  flight_search.add_destination( "MAR","Maracaibo","Venezula")


  

  
  flight_search.print_cheapest_flights
  
  
end

