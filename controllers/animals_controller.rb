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
  @vets = Vet.all
  @owners = Owner.all
  erb(:"animals/new")
end

post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:"animals/show")
end

get '/animals/:id/edit' do
  @animal = Animal.find(params['id'])
  erb(:"animals/edit")
end

# post '/owners/:id' do
#   owner = Owner.new(params)
#   owner.update
#   redirect to "/owners/#{params['id']}"
# end
#
# post '/owners/:id/delete' do
#   owner = Owner.find(params['id'])
#   owner.delete
#   redirect to '/owners'
# end
