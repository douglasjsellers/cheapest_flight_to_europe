#! /usr/bin/ruby
require 'net/http'
require 'rexml/document' 
require 'uri'
require 'kayak_flight_search'
                 
begin
  flight_search = KayakFlightSearch.new( 'XlTLRouSZWMUuk0NlXRjMw',
                                         'n',
                                         'LAX',
                                         'LHR',
                                         '12/18/2010',
                                         '1/1/2011',
                                         1 )

  flight_search.flight_search
  
end
