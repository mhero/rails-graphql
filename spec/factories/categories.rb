# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "MyString#{n}" }
    description { 'MyText' }
  end
end
