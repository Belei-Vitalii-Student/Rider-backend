# frozen_string_literal: true



module Types
  class MutationType < Types::BaseObject
    # field :addUser, Types::UserType, null: false, description: "New user" do
    #   argument :email, String, required: true
    #   argument :name, String, required: true
    #   argument :username, String, required: false
    # end
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
      argument :address, String, required: true
    end
    field :changeUserUsername, Types::UserType, null: false, description: "Change user username" do
      argument :id, ID, required: true
      argument :username, String, required: true
    end
    field :changeUserName, Types::UserType, null: false, description: "Change user name" do
      argument :id, ID, required: true
      argument :name, String, required: true
    end
    field :addUserFriend, Types::UserType, null: false, description: "Add user friend" do
      argument :id, ID, required: true
      argument :friend_id, ID, required: true
    end
    field :removeUserFriend, Types::UserType, null: false, description: "Remove user friend" do
      argument :id, ID, required: true
      argument :friend_id, ID, required: true
    end


    # def addUser(email:, name:, username: nil)
    #   User.create(email: email, name: name, username: username)
    # end

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

    def addPoi(title:, description: nil, image_urls: [], coordinates:, type:, types:, user_id:, address:)
      coordinatesData = coordinates.map { |c| { lat: c.lat, lng: c.lng } }

      poi = Poi.create!(
        title: title,
        description: description,
        image_urls: image_urls,
        coordinates: coordinatesData,
        type: type,
        types: types,
        user_id: user_id,
        address: address
      )

      poi
    end

    def changeUserUsername(id:, username:)
      begin
        user = User.find(id)
        user.username = username
        user.save!
        user
      rescue => e
        puts "Error updating username: #{e.message}"
        raise GraphQL::ExecutionError, "Failed to update username"
      end
    end

    def changeUserName(id:, name:)
      begin
        user = User.find(id)
        user.name = name
        user.save!
        user
      rescue => e
        puts "Error updating name: #{e.message}"
        raise GraphQL::ExecutionError, "Failed to update name"
      end
    end

    def addUserFriend(id:, friend_id:)
      begin
        user = User.find(id)
        friend = User.find(friend_id)
        user.add_friend(friend)
        user.save!
        user
      rescue => e
        puts "Error adding friend: #{e.message}"
      end
    end

    def removeUserFriend(id:, friend_id:)
      begin
        user = User.find(id)
        friend = User.find(friend_id)
        user.remove_friend(friend)
        user.save!
        user
      rescue => e
        puts "Error adding friend: #{e.message}"
      end
    end
  end
end
