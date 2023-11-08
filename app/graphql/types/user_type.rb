module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :email, String, null: true, description: "User's email"
    field :name, String, null: true, description: "User's name"
    field :username, String, null: true, description: "User's username"

    field :paths, [PathType], null: true
    field :places, [PlaceType], null: true
    field :traffic_lights, [TrafficLightType], null: true
  end
end
