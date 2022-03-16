# frozen_string_literal: true

module Types
  module Input
    class ProductUpdateInputType < Types::BaseInputObject
      argument :name, String, required: false
      argument :description, String, required: false
      argument :price, Float, required: false
      argument :quantity, Integer, required: false
      argument :category_ids, [ID], required: false
    end
  end
end
