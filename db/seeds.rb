# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
100.times do
  Brand.create!(name: Faker::Company.unique.name)
end

brands = Brand.all

5000.times do
  Product.create!(
    name: Faker::Commerce.unique.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
    price: Faker::Commerce.price(range: 0.99..999.99),
    brand: brands.sample
  )
end
