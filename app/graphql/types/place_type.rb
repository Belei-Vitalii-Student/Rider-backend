module Types
  class PlaceType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB User id string"
    field :title, String, null: true
    field :description, String, null: true
    field :image_urls, [String], null: true
    field :coordinate, Types::CoordinateType, null: true
    field :type, String, null: true
  end
end
