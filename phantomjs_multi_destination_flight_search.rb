require 'erb'

class MultiDestinationFlightSearch
  def initialize( start_airport_code, start_date, end_date )
    @start_date = start_date
    @end_date = end_date
    @start_airport_code = start_airport_code
    @destinations = []
  end

  def add_destination( airport_code, city_name, country_name )
    @destinations << [url( airport_code), airport_code, city_name, country_name]
  end

  def print_cheapest_flights
    erb = ERB.new( File.read( 'google_api.js.erb' ) )
    javascript_file = erb.result( binding )
    File.open('countries.js', 'w') {|f| f.write(javascript_file) }
    `phantomjs countries.js`
  end
  
  def price
    cheapest_cost =  `phantomjs load_url.js '#{@url}'`
    puts "Using phantom for #{@url} with result #{cheapest_cost}"
    
    if( cheapest_cost.nil? || cheapest_cost.length == 0)
      nil
    else
      cheapest_cost[1..cheapest_cost.length].gsub( ',', '' ).to_i
    end
  end

  private

  def url( airport_code )
    "http://www.google.com/flights/#search;f=#{@start_airport_code};t=#{airport_code};d=#{@start_date};r=#{@end_date}"
    
  end
  
  
end
