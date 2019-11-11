require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end
#
# post '/owners' do
#   Owner.new(params).save
#   redirect to '/owners'
# end
#
get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:"animals/show")
end
