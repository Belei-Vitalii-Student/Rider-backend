module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :email, String, null: true, description: "User's email"
    field :name, String, null: true, description: "User's name"
    field :username, String, null: true, description: "User's username"
    field :picture, String, null: true, description: "User's picture"

    field :pois, [Types::PoiType], null: true
    field :feedbacks, [Types::FeedbackType], null: true
    field :friends, [Types::UserType], null: true

    field :stats, Types::StatsType, null: true

    def stats
      object
    end
  end
end
