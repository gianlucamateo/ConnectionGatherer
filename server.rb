require 'sinatra'

set :port => 2342

get '/hi' do
  "Hello world"
end