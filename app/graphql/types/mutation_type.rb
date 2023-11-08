# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :addUser, Types::UserType, null: false, description: "New user" do
      argument :email, String, required: true
      argument :name, String, required: true
      argument :username, String, required: false
    end
    field :addPath, Types::PathType, null: false, description: "New path" do
      argument :user, String, required: true
      argument :coordinates, [Inputs::CoordinateInput], required: true
    end
    field :addPlace, Types::PlaceType, null: false, description: "New place" do
      argument :user, String, required: true
      argument :title, String, required: true
      argument :description, String, required: false
      argument :image_urls, [String], required: false
      argument :coordinate, Inputs::CoordinateInput, required: true
      argument :type, String, required: true
    end

    def addUser(email:, name:, username: nil)
      User.create(email: email, name: name, username: username)
    end

    def addPath(user:, coordinates:)
      puts "------COORDINATES-------"
      puts coordinates.inspect
      Path.create(user: user, coordinates: coordinates)
    end

    def addPlace(user:, title:, description: nil, image_urls: [], coordinate:, type:)
      Place.create(user: user, title: title, description: description, image_urls: image_urls, coordinate: coordinate, type: type)
    end

  end
end
