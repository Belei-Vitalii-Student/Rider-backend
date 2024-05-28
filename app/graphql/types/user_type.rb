module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :email, String, null: true, description: "User's email"
    field :name, String, null: true, description: "User's name"
    field :username, String, null: true, description: "User's username"

    field :pois, [Types::PoiType], null: true
    field :feedbacks, [Types::FeedbackType], null: true
  end
end
