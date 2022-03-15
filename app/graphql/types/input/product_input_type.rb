# frozen_string_literal: true

module Types
  module Input
    class ProductInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: true
      argument :price, Float, required: true
      argument :quantity, Integer, required: true
    end
  end
end
