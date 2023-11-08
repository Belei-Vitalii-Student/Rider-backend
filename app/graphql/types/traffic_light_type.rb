module Types
  class TrafficLightType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :coordinate, type: Types::CoordinateType, null: false

    field :user, Types::UserType, null: false
  end
end
