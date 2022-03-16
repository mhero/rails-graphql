# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  deleted_at  :datetime
#  price       :decimal(, )
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  audited only: %i[price quantity]

  has_many :product_categories
  has_many :categories, through: :product_categories

  scope :archived, -> { where.not(deleted_at: nil) }
  scope :by_categories, ->(categories) { joins(:categories).where(categories: { name: categories }) }

  def self.search_by(scope:, archived: false, categories: [], price_range: [])
    scope = scope.by_categories(categories) if categories.any?
    scope = scope.archived if archived
    scope.order(created_at: :desc)
  end
end
