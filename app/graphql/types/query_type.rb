# frozen_string_literal: true


module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false, description: "Return users"
    field :user, Types::UserType, null: true do
      argument :id, ID, required: false
      argument :username, String, required: false
    end
    field :pois, [Types::PoiType], null: true, description: "Return Points of Interest" do
      argument :userId, String, required: false
      argument :type, String, required: false
    end
    field :poi, Types::PoiType, null: true, description: "Return Point of Interest by ID" do
      argument :id, ID, required: true
    end

    def pois(type: nil, userId: nil)
      pois = Poi.all

      if userId
        pois = pois.where(user_id: userId)
      end

      if type
        pois = pois.where(type: type)
      end

      pois
    end

    def poi(id:)
      Poi.find(id)
    end

    def users
      User.all
    end

    def user(id: nil, username: nil)
      if id
        User.find(id)
      elsif username
        User.find_by(username: username)
      else
        raise "User not found"
      end
    end

  end
end
