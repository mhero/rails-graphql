# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :product, resolver: Queries::Product
    field :products, resolver: Queries::Products
    field :product_changes, resolver: Queries::ProductChanges

    field :category, resolver: Queries::Category
    field :categories, resolver: Queries::Categories
  end
end
