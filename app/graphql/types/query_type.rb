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
      argument :id, ID, required: true
    end
    field :places, [Types::PlaceType], null: true, description: "Return places" do
      argument :type, String, required: false
    end
    field :place, Types::PlaceType, null: true, description: "Return place by id" do
      argument :id, ID, required: true
    end
    field :paths, [Types::PathType], null: true, description: "Return paths"
    field :path, Types::PathType, null: true, description: "Return path by id" do
      argument :id, ID, required: true
    end
    field :traffic_lights, [Types::TrafficLightType], null: true, description: "Return traffic lights"
    field :traffic_light, Types::TrafficLightType, null: true, description: "Return traffic light by id" do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end


    def places(type: nil)
      if type
        Place.where(type: type)
      else
        Place.all
      end
    end

    def place(id:)
      Place.find(id)
    end


    def paths
      Path.all
    end

    def path(id:)
      Path.find(id)
    end


    def traffic_lights
      TrafficLight.all
    end

    def traffic_light(id:)
      TrafficLight.find(id)
    end

  end
end
