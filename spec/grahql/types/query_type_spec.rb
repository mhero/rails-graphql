# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  subject { RailsGraphqlSchema.execute(query, variables:).to_h }
  let(:variables) { {} }

  describe 'category' do
    let(:query) do
      <<~GRAPHQL
        query($id: ID!){
          category(id: $id){
            id
          }
        }
      GRAPHQL
    end

    let!(:category) { create(:category) }

    let(:variables) do
      {
        id: category.id
      }
    end

    it 'returns the category' do
      expect(subject['data']['category']['id']).to eq category.id.to_s
    end
  end

  describe 'categories' do
    let(:query) do
      <<~GRAPHQL
        query{
          categories{
            name
          }
        }
      GRAPHQL
    end

    let!(:old_category) { create(:category) }
    let!(:new_category) { create(:category) }

    it 'returns all the categories sorted by most recent first' do
      expect(subject['data']['categories'].to_json).to eq [{ name: new_category.name },
                                                           { name: old_category.name }].to_json
    end
  end

  describe 'product' do
    let(:query) do
      <<~GRAPHQL
        query($id: ID!){
          product(id: $id){
            id
          }
        }
      GRAPHQL
    end

    let!(:product) { create(:product) }

    let(:variables) do
      {
        id: product.id
      }
    end

    it 'returns the category' do
      expect(subject['data']['product']['id']).to eq product.id.to_s
    end
  end

  describe 'products' do
    context 'searching all the products' do
      let(:query) do
        <<~GRAPHQL
          query{
            products{
              name
            }
          }
        GRAPHQL
      end

      let!(:product1) { create(:product) }
      let!(:product2) { create(:product) }

      it 'returns all the products' do
        expect(subject['data']['products'].to_json).to eq [{ name: product2.name }, { name: product1.name }].to_json
      end
    end

    context 'searching archived products' do
      let(:query) do
        <<~GRAPHQL
          query($archived: Boolean){
            products(archived: $archived){
              name
            }
          }
        GRAPHQL
      end

      let!(:archived_product) { create(:product) }
      let!(:product2) { create(:product) }

      let(:variables) do
        {
          archived: true
        }
      end

      before do
        archived_product.destroy
      end

      it 'returns all the archived products' do
        expect(subject['data']['products'].to_json).to eq [{ name: archived_product.name }].to_json
      end
    end

    context 'searching products with a price filter' do
      let(:query) do
        <<~GRAPHQL
          query($priceFilter: PriceFilterInput){
            products(priceFilter: $priceFilter){
              name
            }
          }
        GRAPHQL
      end

      let(:variables) do
        {
          priceFilter: {
            price: 10,
            priceComparison: 'BIGGER_THAN'
          }
        }
      end

      let!(:product) { create(:product, price: 11) }
      let!(:product2) { create(:product, price: 8) }

      it 'returns all the products with price bigger than 10' do
        expect(subject['data']['products'].to_json).to eq [{ name: product.name }].to_json
      end
    end
  end
end
