module Types
  class EventType < Types::BaseObject
    graphql_name 'EventType'
    
    field :id, ID, null: false
    field :event_type, String, null: true
    field :event_date, GraphQL::Types::ISO8601DateTime, null: true
    field :title, String, null: true
    field :speaker, String, null: true
    field :host, String, null: true
    field :published, Boolean, null: true
    field :creator, Types::UserType, null: true 
  end
end
