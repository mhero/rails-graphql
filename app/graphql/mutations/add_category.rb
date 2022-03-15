# frozen_string_literal: true

module Mutations
  class AddCategory < Mutations::BaseMutation
    argument :params, Types::Input::CategoryInputType, required: true

    field :category, Types::CategoryType, null: false

    def resolve(params:)
      category_params = Hash params

      begin
        category = Category.create!(category_params)

        { category: }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
                                    " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
