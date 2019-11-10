require_relative ("../models/animal.rb")
require_relative ("../models/owner.rb")
require_relative ("../models/vet.rb")
require ("pry-byebug")

owner1 = Owner.new({
  "name" => "Andrew",
  "address" => "1 Castle Street",
  "phone" => "07111111111"
  })
owner1.save

binding.pry
