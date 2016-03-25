# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create(name: Faker::Hipster.name)

User.create!(username: 'tim', email: 'tim@tim.com', password: 'timtim', admin: true)
User.create!(username: 'tom', email: 'tom@tom.com', password: 'tomtom')

cat1 = Category.create!(name: "Electronics & Computers")
cat2 = Category.create!(name: "Clothing, Shoes & Jewelry")
cat3 = Category.create!(name: "Home, Garden & Tools")
cat4 = Category.create!(name: "Beauty, Health & Grocery")
cat5 = Category.create!(name: "Toys, Kids & Baby")


# arr = [cat1.id, cat2.id, cat3.id]

# test1 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
# Categorization.create!(product_id: test1.id, category_id: cat1.id )

# test2 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
# Categorization.create!(product_id: test2.id, category_id: cat1.id )

# test3 = Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1 )
# Categorization.create!(product_id: test3.id, category_id: cat2.id )

5.times{Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1) }
5.times{Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1) }
5.times{Product.create!(name: Faker::Beer.name, description: Faker::Hipster.sentence, price: Faker::Commerce.price, quantity: Faker::Number.between(1,20), product_image: Faker::Avatar.image, reseller_id: 1) }

x = 1
while x < 5
	ProductCategory.create!(product_id: 1, category_id: x)
	ProductCategory.create!(product_id: 2, category_id: x)
	ProductCategory.create!(product_id: 3, category_id: x)
	ProductCategory.create!(product_id: 4, category_id: x)
	ProductCategory.create!(product_id: 5, category_id: x)
	x += 1
end


