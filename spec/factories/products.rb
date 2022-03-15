# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    description { 'MyText' }
    deleted_at { '2022-03-15 16:39:33' }
    price { '9.99' }
    quantity { 1 }
  end
end
