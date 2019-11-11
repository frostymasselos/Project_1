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

#
get '/vets/:id/edit' do
  @vet = Vet.find(params['id'])
  erb(:"vets/edit")
end
#
# post '/vets/:id' do
#   vet = Vet.new(params)
#   vet.update
#   redirect to "/vets/#{params['id']}"
# end
#
# post '/vets/:id/delete' do
#   vet = Vet.find(params['id'])
#   vet.delete
#   redirect to '/vets'
# end
