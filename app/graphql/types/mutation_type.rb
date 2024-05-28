# frozen_string_literal: true



module Types
  class MutationType < Types::BaseObject
    field :addUser, Types::UserType, null: false, description: "New user" do
      argument :email, String, required: true
      argument :name, String, required: true
      argument :username, String, required: false
    end
    field :addFeedback, Types::FeedbackType, null: true, description: "Create a new feedback" do
      argument :description, String, required: true
      argument :feedback, String, required: true
      argument :poi_id, ID, required: true
      argument :user_id, ID, required: true
    end
    field :addPoi, PoiType, null: false, description: "Add a new Point of Interest" do
      argument :title, String, required: true
      argument :description, String, required: false
      argument :image_urls, [String], required: false
      argument :coordinates, [Inputs::CoordinateInput], required: true
      argument :type, String, required: true
      argument :types, [String], required: false
      argument :user_id, ID, required: true
    end

    def addUser(email:, name:, username: nil)
      User.create(email: email, name: name, username: username)
    end

    def addFeedback(description:, feedback:, poi_id:, user_id:)
      poi = Poi.find(poi_id)
      user = User.find(user_id)

      Feedback.create!(
        description: description,
        feedback: feedback,
        poi: poi,
        user: user,
      )
    end

    def addPoi(title:, description: nil, image_urls: [], coordinates:, type:, types:, user_id:)
      coordinatesData = coordinates.map { |c| { lat: c.lat, lng: c.lng } }

      poi = Poi.create!(
        title: title,
        description: description,
        image_urls: image_urls,
        coordinates: coordinatesData,
        type: type,
        types: types,
        user_id: user_id
      )

      poi
    end

  end
end
