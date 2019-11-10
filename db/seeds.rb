require_relative ("../models/animal.rb")
require_relative ("../models/owner.rb")
require_relative ("../models/vet.rb")
require ("pry-byebug")

Animal.delete_all
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

animal1 = Animal.new({
  "name" => "Alex",
  "d_o_b" => "01/01/95",
  "type" => "Aardvark",
  "notes" => "blah blah blah",
  "vet_id" => vet1.id,
  "owner_id" => owner1.id
  })
animal2 = Animal.new({
  "name" => "Bernie",
  "d_o_b" => "02/01/95",
  "type" => "Badger",
  "notes" => "blah blah blah",
  "vet_id" => vet2.id,
  "owner_id" => owner2.id
  })
animal1.save
animal2.save




binding.pry
nil
