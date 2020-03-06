require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "how are you doing?"
end

get '/no/more' do
  "this is [/no/more]"
end

get '/pom/*' do |name|
  "my name is #{name}"
end

get '/erb_temp' do
  erb :temp
end
