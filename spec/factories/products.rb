# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    description { 'MyText' }
    price { 9.99 }
    quantity { 1 }
  end
end
