# frozen_string_literal: true

module Queries
  class FetchProducts < Queries::BaseQuery
    type [Types::ProductType], null: false

    def resolve
      Product.all.order(created_at: :desc)
    end
  end
end
