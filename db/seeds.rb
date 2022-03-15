# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  Category.create(name: "Category #{i + 1}", description: 'Lorem ipsum saves lives')
end

10.times do |i|
  Product.create(
    name: "Product #{i + 1}",
    description: 'Lorem ipsum saves lives',
    price: rand(1..100),
    quantity: rand(1..100),
    categories: Category.all.sample(rand(2..3))
  )
end
