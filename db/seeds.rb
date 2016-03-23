# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: Faker::Hipster.name)


cat1 = Category.create!(name: "apple")
cat2 = Category.create!(name: "orange")
cat3 = Category.create!(name: "banana")

arr = [cat1.id, cat2.id, cat3.id]

test1 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
Categorization.create!(product_id: test1.id, category_id: cat1.id )

test2 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
Categorization.create!(product_id: test2.id, category_id: cat1.id )

test3 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
Categorization.create!(product_id: test3.id, category_id: cat2.id )