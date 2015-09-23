require 'sinatra'
require 'net/http'
require 'json'

set :port => 2342

get '/connections' do
  # matches "GET /connections?x=locx&y=locy&dest=station"
  x = params['x'];
  y = params['y'];
  dest = params['dest'];
  uri = URI("http://transport.opendata.ch/v1/locations?x=#{x}&y=#{y}")
  response = JSON.parse(Net::HTTP.get(uri))
  station_names = []
  for i in 0..response['stations'].length-1
    station_names.push(response['stations'][i]['name'])
  end
  response['stations'][0]['name']
end