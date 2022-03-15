# frozen_string_literal: true

module Types
  module Input
    class CategoryInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: true
    end
  end
end
