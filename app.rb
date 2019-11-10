require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/vet_controller')
require_relative('controllers/owner_controller')
require_relative('controllers/animal_controller')

get '/' do
  erb(:index)
end
