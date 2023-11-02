module Types
  class CoordinateType < Types::BaseObject
    field :lat, Float, null: false
    field :lng, Float, null: false
  end
end
