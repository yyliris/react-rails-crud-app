module Types
  class QueryType < Types::BaseObject

    field :events, [Types::EventType], null: false
    def events
      Event.all
    end

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, required: false
    end
    def user(id:)
      User.find(id)
    end

    field :event, Types::EventType, null: false do
      argument :id, Int, required: false
    end
    def event(id:)
      Event.find(id)
    end
    
  end
end
