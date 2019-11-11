require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/vet.rb')
also_reload('../models/*')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  Owner.new(params).save
  redirect to '/owners'
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end
#
# post '/vets/:id/delete' do
#   vet = Vet.find(params['id'])
#   vet.delete
#   redirect to '/vets'
# end
