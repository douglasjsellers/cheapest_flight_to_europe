require 'mechanize'
require 'json'

class MultiDestinationFlightSearch
  def initialize( origin, departure_date, return_date )
    @origin = origin
    @departure_date = departure_date
    @return_date = return_date
    @destinations = []
  end

  def add_destination( airport_code, city, destination )
    @destinations << [airport_code, city, destination ]
  end
  
  def find_cheapest_flights
    flights = []
    @destinations.each do |destination|
      price, url = find_flight_cost( destination.first )
      if( price.nil? )
        puts "No flight to #{destination.first}"
      else
        flights << [price,url] + destination
      end
    end

    flights.sort { |a,b| a.first <=> b.first }
  end

  def print_cheapest_flights
    cheapest_flights = find_cheapest_flights

    puts ""
    puts "Sorted Results"
    puts "--------------"
    cheapest_flights.each do |flight|
      price, url, airport_code, city, destination = *flight
      puts "#{price}, #{city}, #{url}"
    end
    
  end
  
  private
  def find_flight_cost( airport_code )
    num_days = (Date.parse( @return_date ).mjd - Date.parse(@departure_date).mjd)
    
    json = '[,[[,"ca","[,[,[\"' + @origin + '\"]\n,\"\",[\"' + airport_code +'\"]\n,\"\",,,,,,,,,,,,,1]\n,\"' + @departure_date+ '\",\"' + @departure_date +'\",' + num_days.to_s + ']\n",,18]
]
]'

    headers = {}
    headers['Content-Type'] = 'application/json; charset=utf-8'
    headers['X-GWT-Permutation'] = '0BB89375061712D90759336B50687E78'
    headers['X-GWT-Module-Base']='http://www.google.com/flights/static/'
    headers['Referer']='http://www.google.com/flights/'
    returned_json = ( (Mechanize.new.post 'http://www.google.com/flights/rpc', json, headers).body )
    if( returned_json.nil? || returned_json.split( ',' )[7].nil? )
      return nil, nil
    else
      price = returned_json.split( ',' )[7].split(']').first.to_i / 100
      url = "http://www.google.com/flights/#search;f=#{@origin};t=#{airport_code};d=#{@departure_date};r=#{@return_date}"

      return price,url
    end
    
    
  end
  
  
end
