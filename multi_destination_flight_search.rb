require 'kayak_flight_search'

class MultiDestinationFlightSearch
  def initialize( token,
                  origin,
                  dep_date,
                  ret_date,
                  travelers)
    @kayak_api_key = token
    @oneway = 'n'
    @origin = origin
    @start_date = dep_date
    @end_date = ret_date
    @num_travelers = travelers
    @destinations = []
  end

  def add_destination( airport_code, city, destination )
    @destinations << [ city, destination, airport_code ]
  end

  def find_flights
    @results = []
    @destinations.each do |current_location|
      begin
        flight_search = KayakFlightSearch.new( @kayak_api_key,
                                               @oneway,
                                               @origin,
                                               current_location.last,
                                               @start_date,
                                               @end_date,
                                               @num_travelers.to_i )
      
        flight_search.flight_search( true )
        cost, url, whole_elements = *flight_search.cheapest_flight
        puts "Processed #{current_location[0]}, #{current_location[1]} (#{current_location[2]}) @ #{cost} USD"
        @results << [ cost, current_location, "http://api.kayak.com#{url}"]
      rescue
        puts "Failed to process #{current_location[0]}, #{current_location[1]} (#{current_location[2]})"
      end
    end
    @results
  end

  def find_cheapest_flights
    find_flights if @results.nil?

    sorted_results = @results.sort { |a,b| a.first <=> b.first }
    sorted_results
  end

  def print_cheapest_flights
    cheapest_flights = self.find_cheapest_flights

    puts ""
    puts "Sorted Results"
    puts "--------------"
    
    cheapest_flights.each do |result_array|
      cost, current_location, url = *result_array
      puts "#{cost}, #{current_location[0]}, #{current_location[1]},
#{current_location[2]}, #{url}"
    end

    puts ""
    
  end
  
  
  
  
  
end
