#! /usr/bin/ruby
require 'mechanize'
require 'json'
require 'pp'


start_date = "2012-12-18"
end_date = "2013-01-02"
start_location = "LAX,LGB,SNA,BUR,ONT"
end_location = "LNA"

json_start_location = start_location.split( ',' ).map { |location| '\"' + location + '\"' }.join( ',' )


def make_google_api_request( json )
  headers = {}
  headers['Content-Type'] = 'application/json; charset=utf-8'
  headers['X-GWT-Permutation'] = '475BAF4AEBA848B4F2A7E0E8803D533E'
  headers['X-GWT-Module-Base']='http://www.google.com/flights/static/'
  headers['Referer']='http://www.google.com/flights/'

  (Mechanize.new.post 'http://www.google.com/flights/rpc', json, headers).body  
end


def make_fs_call( json_start_location, start_date, end_date, start_location, end_location )
  json = '[,[[,"fs","[,[,[' + json_start_location + ']\n,\"'+start_date+ '\",[\"' + end_location + '\"]\n,\"' + end_date + '\",,,,,,,,,,,,,1]\n]\n",,]
]
,[,[[,"b_al","no:58"]
,[,"b_ca","64:96201"]
,[,"f_ut","search;f=' + start_location + ';t=' + end_location +';d=' + start_date +';r=' + end_date + '"]
,[,"b_am","fs"]
,[,"b_qu","2"]
,[,"b_qc","1"]
]
]
]'
  puts make_google_api_request( json )
  
end


def make_second_fs_call( json_start_location, start_date, end_date, start_location, end_location )
  json = '[,[[,"fs","[,[,[' + json_start_location + ']\n,\"' + start_date + '\",[\"' + end_location + '\"]\n,\"' + end_date + '\",,,,,,,,,,,,,1]\n]\n",,,]
]
,[,[[,"b_al","fs:130"]
,[,"b_lr","13:158"]
,[,"b_qu","0"]
,[,"b_qc","3"]
]
]
]'
  puts make_google_api_request( json )
end

def make_ld_call( json_start_location, start_date, end_date, start_location, end_location )
  json = '[,[[,"ld","[,[\"' + end_location + '\"]\n]\n",,29]
]
,
]'
  
end

def make_fa_call( json_start_location, start_date, end_date, start_location, end_location )
json = '[,[[,"fa","[,[,[' + json_start_location + ']\n,\"' + start_date +'\",[\"' + end_location + '\"]\n,\"' + end_date+ '\"]\n,[1004]\n]\n",,18]
]
,[,[[,"b_qu","1"]
,[,"b_qc","2"]
]
]
]'
  puts make_google_api_request( json )
  
end

def make_tb_call( json_start_location, start_date, end_date, start_location, end_location )
  json = '[,[[,"tb","[,[,[' + json_start_location + ']\n,\"' + start_date + '\",[\"' + end_location + '\"]\n,\"' + end_date + '\"]\n]\n",,8]
]
,[,[[,"b_al","ld:140"]
,[,"b_am","ca"]
,[,"b_qu","0"]
,[,"b_qc","4"]
]
]
]'


  puts make_google_api_request( json )
end


def load_page( json_start_location, start_date, end_date, start_location, end_location )
  url = "http://www.google.com/flights/#search;f=#{start_location};t=#{end_location};d=#{start_date};r=#{end_date}"
  cheapest_cost =  `phantomjs load_url.js '#{url}'`
  if( cheapest_cost.nil? || cheapest_cost.length == 0)
    nil
  else
    cheapest_cost[1..cheapest_cost.length].gsub( ',', '' ).to_i
  end
end

def make_ca_call( json_start_location, start_date, end_date, start_location, end_location )
  num_days = Date.parse( end_date ).mjd - Date.parse(start_date).mjd  
  json = '[,[[,"ca","[,[,[' + json_start_location + ']\n,\"\",[\"' + end_location +'\"]\n,\"\",,,,,,,,,,,,,1]\n,\"' + start_date+ '\",\"' + start_date +'\",' + num_days.to_s + ']\n",,]
],
]'
  response = make_google_api_request( json )
  puts response
  price = response.split( ',' )[7].split(']').first.to_i / 100
  url = "http://www.google.com/flights/#search;f=#{start_location};t=#{end_location};d=#{start_date};r=#{end_date}"

  puts price
  puts url
end

def make_ss_call( json_start_location, start_date, end_date, start_location, end_location )
  json = '[,[[,"ss","[,\"4CAE0A167A560.A42FC05.4C46\",1,6,[,[' + json_start_location + ']\n,\"' + start_date + '\",[\"' + end_location + '\"]\n,\"' + end_date + '\"]\n]\n",,32]
]
,[,[[,"b_lr","5:6"]
,[,"b_lr","6:35"]
,[,"b_al","fa:326"]
,[,"b_ar","true"]
,[,"b_qu","0"]
,[,"b_qc","3"]
]
]
]'
  puts make_google_api_request( json )
  
end

# Do Flight Search
#make_fs_call( json_start_location, start_date, end_date, start_location, end_location )
#make_ld_call( json_start_location, start_date, end_date, start_location, end_location )
#make_tb_call( json_start_location, start_date, end_date, start_location, end_location )
#make_fa_call( json_start_location, start_date, end_date, start_location, end_location )
#make_second_fs_call( json_start_location, start_date, end_date, start_location, end_location )
#make_ss_call( json_start_location, start_date, end_date, start_location, end_location )

begin
  make_ca_call( json_start_location, start_date, end_date, start_location, end_location )
rescue
  puts load_page( json_start_location, start_date, end_date, start_location, end_location )
end


