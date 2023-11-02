module Types
  class PathType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :coordinates, [Types::CoordinateType], null: true, description: "Path array"
  end
end
