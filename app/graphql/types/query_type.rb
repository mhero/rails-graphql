# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_product, resolver: Queries::FetchProduct
    field :fetch_products, resolver: Queries::FetchProducts
    field :fetch_product_changes, resolver: Queries::FetchProductChanges

    field :fetch_category, resolver: Queries::FetchCategory
    field :fetch_categories, resolver: Queries::FetchCategories
  end
end
