module Types
  class PoiTypeEnum < Types::BaseEnum
    value "place", "A place of interest"
    value "path", "A path or route"
  end

  class PoiType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB Poi id string"
    field :title, String, null: false, description: "Title of the Point of Interest"
    field :address, String, null: true, description: "Address of the Point of Interest"
    field :description, String, null: true, description: "Description of the Point of Interest"
    field :image_urls, [String], null: true, description: "Array of image URLs for the Point of Interest"
    field :coordinates, [Types::CoordinateType], null: false, description: "Coordinates of the Point of Interest"
    field :type, Types::PoiTypeEnum, null: false, description: "Type of the Point of Interest"
    field :types, [String], null: true, description: "Types of the Point of Interest"
    field :created_at, String, null: false, description: "Timestamp when the Point of Interest was created"
    field :updated_at, String, null: false, description: "Timestamp when the Point of Interest was last updated"

    field :user, Types::UserType, null: false
    field :feedbacks, [Types::FeedbackType], null: true

        def likes
      object.feedbacks.count { |feedback| feedback.feedback == 'like' }
    end

    def dislikes
      object.feedbacks.count { |feedback| feedback.feedback == 'dislike' }
    end

    field :likes, Int, null: false
    field :dislikes, Int, null: false
  end
end
