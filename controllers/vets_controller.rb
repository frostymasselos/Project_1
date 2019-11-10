require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/vets' do
  @vets = Vet.all
  erb(:"vets/index")
end
