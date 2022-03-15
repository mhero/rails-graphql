# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_category, mutation: Mutations::AddCategory
  end
end
