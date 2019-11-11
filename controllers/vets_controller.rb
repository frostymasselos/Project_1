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

get '/vets/:id' do
  @vet = Vet.find(params['id'].to_i)
  erb(:"vets/show")
end

# get '/vets/:id/:id' do
#   @vet = Vet.find(params['id'].to_i)
#   erb(:"vets/show_")
# end

# Params must always convert into string (in Sinatra)
# Why can't '/vets/:id' be anything?
