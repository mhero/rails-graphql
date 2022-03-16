# frozen_string_literal: true

module Queries
  class Products < Queries::BaseQuery
    type [Types::ProductType], null: false
    argument :archived, Boolean, required: false
    argument :categories, [String], required: false
    argument :price_filter, Types::Input::PriceFilterInputType, required: false

    def resolve(archived: false, categories: [], price_filter: nil)
      ::Product.search_by(
        scope: ::Product.includes(:categories),
        archived:,
        categories:,
        price_filter:
      )
    end
  end
end
