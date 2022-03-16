# frozen_string_literal: true

module Mutations
  class DeleteProduct < Mutations::BaseMutation
    argument :id, ID, required: true

    field :product, Types::ProductType, null: false

    def resolve(id:)
      Product.find(id).update(deleted_at: Time.zone.now)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new('Product does not exist.')
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                  " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
