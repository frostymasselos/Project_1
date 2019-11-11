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
  @owners = Owner.all
  @vets = Vet.all
  erb(:"animals/new")
end
