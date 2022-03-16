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
  acts_as_paranoid

  audited only: %i[price quantity]

  has_many :product_categories
  has_many :categories, through: :product_categories

  scope :by_categories, ->(categories) { joins(:categories).where(categories: { name: categories }) }
  scope :price_less_than, ->(price) { where('price < ?', price) }
  scope :price_bigger_than, ->(price) { where('price > ?', price) }

  def self.search_by(scope:, archived: false, categories: [], price_filter: nil)
    scope = scope.by_categories(categories) if categories.any?
    scope = scope.only_deleted if archived
    scope = search_by_price(scope:, price_filter:) if price_filter.present?
    scope.order(created_at: :desc)
  end

  def self.search_by_price(scope:, price_filter:)
    case price_filter[:price_comparison].downcase.to_sym
    when :less_than
      scope.price_less_than(price_filter[:price])
    when :bigger_than
      scope.price_bigger_than(price_filter[:price])
    else
      scope
    end
  end
end
