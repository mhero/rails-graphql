# frozen_string_literal: true

module Queries
  class FetchProduct < Queries::BaseQuery
    type Types::ProductType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Product.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Product does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                  " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
