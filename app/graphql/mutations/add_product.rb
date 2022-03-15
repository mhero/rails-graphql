# frozen_string_literal: true

module Mutations
  class AddProduct < Mutations::BaseMutation
    argument :params, Types::Input::ProductInputType, required: true

    field :product, Types::ProductType, null: false

    def resolve(params:)
      product_params = Hash params

      begin
        product = Product.create!(product_params)

        { product: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                    " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
