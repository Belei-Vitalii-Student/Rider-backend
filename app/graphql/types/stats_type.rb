module Types
  class StatsType < Types::BaseObject
    field :user, Types::UserType, null: false
    field :places, GraphQL::Types::Int, null: true
    field :paths, GraphQL::Types::Int, null: true
    field :likes, GraphQL::Types::Int, null: true
    field :friends, GraphQL::Types::Int, null: true

    def user
      object
    end

    def places
      object.pois.where(type: 'place').count
    end

    def paths
      object.pois.where(type: 'path').count
    end

    def likes
      object.pois.map { |poi| poi.feedbacks.where(feedback: 'like').count }.sum
    end

    def friends
      object.friends.count
    end
  end
end
