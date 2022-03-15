# frozen_string_literal: true

module Queries
  class FetchCategories < Queries::BaseQuery
    type [Types::CategoryType], null: false

    def resolve
      Category.all.order(created_at: :desc)
    end
  end
end
