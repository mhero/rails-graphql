# frozen_string_literal: true

require 'rails_helper'

RSpec.fdescribe Types::QueryType do
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
end
