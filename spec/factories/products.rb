FactoryBot.define do
  factory :product do
    brand
    name { Faker::Commerce.unique.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price(range: 0.99..999.99) }
  end
end
