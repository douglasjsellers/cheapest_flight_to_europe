#! /usr/bin/ruby
require 'net/http'
require 'rexml/document' 
require 'uri'
require 'kayak_flight_search'
                 
begin
  flight_search = KayakFlightSearch.new( 'XlTLRouSZWMUuk0NlXRjMw' )

  searchid = flight_search.start_flight_search( 'n', 'LAX', 'LHR', '12/18/2010', '1/1/2011', 1 )
    
  sleep(2)

  # now poll results (only gets "top 10" each time)
  more = flight_search.poll_results( searchid, nil)
  while more == 'true' do
    more = flight_search.poll_results( searchid, nil)
    sleep(3)
  end

  flight_search.poll_results( searchid )
  puts "Results stored in ksearchresults.xml"
end
