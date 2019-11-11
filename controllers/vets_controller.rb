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

get '/vets/new' do
  erb(:"vets/new")
end

post '/vets' do
  Vet.new(params).save
  redirect to '/vets'
end

get '/vets/:id' do
  @vet = Vet.find(params['id'])
  erb(:"vets/show")
end

get '/vets/:id/edit' do
  @vet = Vet.find(params['id'])
  erb(:"vets/edit")
end

post '/vets/:id' do
  vet = Vet.new(params)
  vet.update
  redirect to "/vets/#{params['id']}"
end

post '/vets/:id/delete' do
  vet = Vet.find(params['id'])
  vet.delete
  redirect to '/vets'
end

# ^ Remember this has to come first - the program
# will run the the first :id. This :id is a wildcard
# and can be anything!

# Params must always convert into string (in Sinatra)
# Why can't '/vets/:id' be anything?
