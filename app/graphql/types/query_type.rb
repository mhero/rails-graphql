# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :fetch_categories, resolver: Queries::FetchCategories
    field :fetch_category, resolver: Queries::FetchCategory
  end
end
