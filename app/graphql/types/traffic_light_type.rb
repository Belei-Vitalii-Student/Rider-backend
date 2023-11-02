module Types
  class TrafficLightType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :coordinate, type: Object, null: false
  end
end
