# frozen_string_literal: true

module Types
  class AuditType < Types::BaseObject
    field :id, ID, null: false
    field :audited_changes, GraphQL::Types::JSON, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
