require 'sinatra'
require 'json'
require 'pry'
require './models/custom_db'
#routsy tworze sobie tutaj i routsy dzialaja jak kontrollery

set :bind, '0.0.0.0'

get '/' do
  File.open('templates/home/root.rhtml')
end

######## Cars
get '/cars' do
  CustomDB.all['cars'].to_json
end

post '/cars' do
  CustomDB.create('cars', color: params[:color], brand: params[:brand]).to_json
end

put '/cars/:id' do
  CustomDB.update('cars', params[:id], color: params[:color], brand: params[:brand]).to_json
end

######## Users

get '/users' do
  CustomDB.all['users'].to_json
end