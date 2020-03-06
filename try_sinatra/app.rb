require 'sinatra'
require 'sinatra/reloader'

get '/' do
  'how are you doinga?'
end

get '/no/more' do
  'this is [/no/more]'
end
