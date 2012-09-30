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

  def cheapest_flights
    erb = ERB.new( File.read( 'google_api.js.erb' ) )
    javascript_file = erb.result( binding )
    File.open('countries.js', 'w') {|f| f.write(javascript_file) }
    results = `phantomjs countries.js`
    results.split( "\n" ).sort do |a, b|
      convert_price_to_integer( a.split( ' , ' ).first ) <=> convert_price_to_integer( b.split( ' , ').first )
    end.join( "\n" )
  end

  def print_cheapest_flights
    puts cheapest_flights
  end
  
  

  private
  
  def convert_price_to_integer( cheapest_cost )
    cheapest_cost[1..cheapest_cost.length].gsub( ',', '' ).to_i
  end

  def url( airport_code )
    "http://www.google.com/flights/#search;f=#{@start_airport_code};t=#{airport_code};d=#{@start_date};r=#{@end_date}"
    
  end
  
  
end
