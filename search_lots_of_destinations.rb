#! /usr/bin/ruby
require 'net/http'
require 'rexml/document' 
require 'uri'

@@token ='XlTLRouSZWMUuk0NlXRjMw'
@@hostname = 'api.kayak.com'
@@port = 80

def getsession(token)
  sid = nil
  Net::HTTP.start(@@hostname, @@port) do |http|
    response = http.get("/k/ident/apisession?token=#{token}")
    puts "http://#{@@hostname}/k/ident/apisession?token=#{token}"
    body = response.body
    xml = REXML::Document.new(body)
    sid = xml.elements['//sid'].text
  end
  return sid
end

def start_flight_search(sid,
                        oneway,
                        origin,
                        destination,
                        dep_date,
                        ret_date,
                        travelers)
  url = "/s/apisearch?basicmode=true&oneway=n&origin=#{origin}&destination=#{destination}&destcode=&depart_date=#{dep_date}&depart_time=a&return_date=#{ret_date}&return_time=a&travelers=#{travelers}&cabin=f&action=doflights&apimode=1&_sid_=#{sid}"
  return start_search(url)
end

def start_hotel_search(sid,
                       citystatecountry,
                       dep_date,
                       ret_date,
                       travelers)
  csc = URI.escape(citystatecountry)
  dep_date = URI.escape(dep_date)
  ret_date = URI.escape(ret_date)
  url = "/s/apisearch?basicmode=true&othercity=#{csc}&checkin_date=#{dep_date}&checkout_date=#{ret_date}&minstars=-1&guests1=#{travelers}&guests2=1&rooms=1&action=dohotels&apimode=1&_sid_=#{sid}"
  return start_search(url)
end

def start_search(url)
  searchid = nil
  Net::HTTP.start(@@hostname, @@port) do |http|
    response = http.get(url)
    puts "http://#{@@hostname}#{url}"
    body = response.body
    puts body
    File.open("ksearchid.xml", "w") do |f|
      f.puts(body)
    end
    xml = REXML::Document.new(body)
    searchid = xml.elements['//searchid']
    if searchid 
      searchid = searchid.text
    else
      puts "search error:"
      puts body
      return nil
    end
  end
  return searchid
end

@@results = []
@@lastcount = 0

# for debugging only, load results
# from a file.
def poll_results_file(searchtype)
  f = File.new("ksearchresults.xml", "r")
  xmltext = f.read
  return handle_results(searchtype, xmltext)
end

def poll_results(searchtype, sid, searchid, count)
  url = ""
  case 
  when searchtype == 'f': url = "/s/apibasic/flight?searchid=#{searchid}&apimode=1&_sid_=#{sid}"
    when searchtype == 'h': url = "/s/apibasic/hotel?searchid=#{searchid}&apimode=1&_sid_=#{sid}"
  end
  more = nil
  Net::HTTP.start(@@hostname, @@port) do |http|
    if count
      url += "&c=#{count}"
    end
    response = http.get(url)
    puts "http://#{@@hostname}#{url}"
    body = response.body
    File.open("ksearchbody.xml", "w") do |f|
      f.puts(body)
    end
    more = handle_results(searchtype, body)
    if more != 'true'
      # save the body, so we can test without doin
      # an actual search 
      File.open("ksearchresults.xml", "w") do |f|
        f.puts(body)
      end
    end
  end
  return more
end


# process the xml result string
def handle_results(searchtype, body)
  xml = REXML::Document.new(body)
  more = xml.elements['/searchresult/morepending']
  @@lastcount = xml.elements['/searchresult/count'].text
  if more
    more = more.text
  end
  if more != 'true'
    @@results = []
    #puts "count=#{@@lastcount}"
    if (searchtype == 'f')
      # this loop over the XML is just for illustration.
      # once you have the XML, the rest is not that interesting.
      xml.elements.each("/searchresult/trips/trip") do |e|
        e.each_element("price") do |t|
          # pull the prices out of the trip XML element
          #puts t.text
          #puts t.attribute("url")
        end
        e.each_element("legs") do |legs|
          legs.each_element("leg") do |l|
            # do something with the leg XML element
            l.each_element do |ld| 
              # leg XML contains detail info. 
            end
          end # leg in legs loop
        end # legs in trip loop
      end # each trip
    end # if flight search

    if (searchtype == 'h')
      xml.elements.each("/searchresult/hotels/hotel") do |e|
        # do something interesting with the hotel XML
        e.each_element("price") do |t|
          #puts t.text
          #puts t.attribute("url")
        end
      end # each hotel
    end # if hotel search
  end
  return more
end
                 
begin
  if ARGV.size < 4 || ARGV.size > 5
    puts "USAGE:"
    puts "ksearch f ORIGIN_AIPORT DESTINATION_AIRPORT DEPART_DATE [RETURN_DATE]"
    puts "ksearch h \"city, RC, CC\" CHECKIN_DATE CHECKOUT_DATE"
  end

  searchtype = ARGV[0]

  sid = getsession(@@token);
  if !sid 
    puts "bad token, sorry"
    exit 1
  end
  puts "session id = #{sid}"
  if (searchtype == 'f') 
    searchid = start_flight_search(sid, 'n', ARGV[1], ARGV[2], ARGV[3], ARGV[4], 1)
  elsif (searchtype == 'h') 
    searchid = start_hotel_search(sid, ARGV[1], ARGV[2], ARGV[3], 1)
  else
    puts "unknown search type #{searchtype}; should be 'f' or 'h'"
  end
  if !searchid
    puts "search failed. see error document."
    exit 1
  end
  puts "search id = #{searchid}"
  sleep(2)

  # now poll results (only gets "top 10" each time)
  more = poll_results(searchtype, sid, searchid, nil)
  while more == 'true' do
    more = poll_results(searchtype, sid, searchid, nil)
    puts "more to come: #{more} #{@@lastcount} so far"
    sleep(3)
  end
  
  #one final call to get all results (instead of only 10)
  poll_results(searchtype, sid, searchid, @@lastcount)

  puts "Results stored in ksearchresults.xml"
end
