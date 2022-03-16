# frozen_string_literal: true

module Types
  module Input
    class PriceFilterInputType < Types::BaseInputObject
      argument :price, Float, required: true
      argument :price_comparison, NumberComparisonEnum, required: true
    end
  end
end
