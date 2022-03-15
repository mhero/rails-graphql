# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
    field :price, Float, null: true
    field :quantity, Integer, null: true
    field :categories, [Types::CategoryType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :quantity, Integer, null: false
  end
end
