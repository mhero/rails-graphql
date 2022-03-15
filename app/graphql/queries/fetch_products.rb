# frozen_string_literal: true

module Queries
  class FetchProducts < Queries::BaseQuery
    type [Types::ProductType], null: false
    argument :archived, Boolean, required: false
    argument :categories, [String], required: false
    argument :price_range, [Float], required: false

    def resolve(archived: false, categories: [], price_range: [])
      Product.search_by(
        scope: Product.includes(:categories),
        archived:,
        categories:,
        price_range:
      )
    end
  end
end
