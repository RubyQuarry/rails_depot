# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.create!(title: "programming ruby",
description: %{<p> Ruby is the fastest growing and most exiting
dynamic language out there.  If you need to get working programs delivered fast.
  </p>},
image_url: 'door.jpg',
price: 49.95)



Product.create!(title: "Muffins",
                description: %{<p> This is muffin  </p>},
                image_url: 'muffin.jpg',
                price: 49.95)