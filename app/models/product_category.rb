# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  belongs_to :category
  belongs_to :product
end
