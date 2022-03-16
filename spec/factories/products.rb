# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "MyString#{n}" }
    description { 'MyText' }
    price { 9.99 }
    quantity { 1 }
  end
end
