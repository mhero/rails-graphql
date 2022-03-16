# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_category, mutation: Mutations::AddCategory
    field :add_product, mutation: Mutations::AddProduct
    field :delete_product, mutation: Mutations::DeleteProduct
  end
end
