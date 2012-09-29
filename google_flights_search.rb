#! /usr/bin/ruby
require 'mechanize'
require 'json'
require 'pp'


start_date = "2012-10-01"
end_date = "2012-10-31"
start_location = "LAX"
end_location = "OKC"

num_days = Date.parse( end_date ).mjd - Date.parse(start_date).mjd
json = '[,[[,"ca","[,[,[\"' + start_location + '\"]\n,\"\",[\"' + end_location +'\"]\n,\"\",,,,,,,,,,,,,1]\n,\"' + start_date+ '\",\"' + start_date +'\",' + num_days.to_s + ']\n",,18]
]
]'
require 'mechanize'
headers = {}
headers['Content-Type'] = 'application/json; charset=utf-8'
headers['X-GWT-Permutation'] = '0BB89375061712D90759336B50687E78'
headers['X-GWT-Module-Base']='http://www.google.com/flights/static/'
headers['Referer']='http://www.google.com/flights/'
price = ( (Mechanize.new.post 'http://www.google.com/flights/rpc', json, headers).body ).split( ',' )[7].split(']').first.to_i / 100
url = "http://www.google.com/flights/#search;f=#{start_location};t=#{end_location};d=#{start_date};r=#{end_date}"
puts price
puts url
