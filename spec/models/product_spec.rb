# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:category_a) { create(:category, name: 'A') }
  let!(:category_b) { create(:category, name: 'B') }
  let!(:product_a) { create(:product, name: 'P1', categories: [category_a], price: 20) }
  let!(:product_b) { create(:product, name: 'P2', categories: [category_b, category_a], price: 10.5) }

  describe 'products' do
    it 'returns products by categories' do
      expect(Product.by_categories(['A']).to_a).to eq([product_a, product_b])
      expect(Product.by_categories(['B']).to_a).to eq([product_b])
    end

    it 'returns products by price' do
      expect(
        Product.search_by_price(
          scope: Product.all,
          price_filter: { price_comparison: 'less_than', price: 15 }
        )
      ).to eq([product_b])
      expect(
        Product.search_by_price(
          scope: Product.all,
          price_filter: { price_comparison: 'bigger_than', price: 15 }
        )
      ).to eq([product_a])
    end

    describe 'search by' do
      it 'returns products by categories and price' do
        expect(
          Product.search_by(
            scope: Product.all,
            archived: false,
            categories: ['A'],
            price_filter: { price_comparison: 'bigger_than', price: 15 }
          )
        ).to eq([product_a])
      end

      it 'returns archived(deleted) products by categories and price' do
        product_b.destroy
        expect(
          Product.search_by(
            scope: Product.all,
            archived: true,
            categories: ['A'],
            price_filter: { price_comparison: 'less_than', price: 15 }
          )
        ).to eq([product_b])
      end
    end
  end
end
