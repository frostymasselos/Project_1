require_relative ("../models/animal.rb")
require_relative ("../models/owner.rb")
require_relative ("../models/vet.rb")
require ("pry-byebug")

Owner.delete_all
Vet.delete_all

owner1 = Owner.new({
  "name" => "Andrew",
  "address" => "1 Castle Street",
  "phone" => "07111111111"
  })
owner2 = Owner.new({
  "name" => "Bertrand",
  "address" => "2 Castle Street",
  "phone" => "07222222222"
  })
owner1.save
owner2.save

vet1 = Vet.new({
  "name" => "Angus"
  })
vet2 = Vet.new({
  "name" => "Barry"
  })
vet1.save
vet2.save


binding.pry
nil
