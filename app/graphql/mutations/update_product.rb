# frozen_string_literal: true

module Mutations
  class UpdateProduct < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :params, Types::Input::ProductUpdateInputType, required: true

    field :product, Types::ProductType, null: false

    def resolve(id:, params:)
      product_params = Hash params

      begin
        product = Product.find(id)
        product.update!(product_params)

        { product: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                    " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
