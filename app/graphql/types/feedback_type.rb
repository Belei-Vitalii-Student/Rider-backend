module Types
  class FeedbackType < Types::BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :feedback, String, null: true
    field :type, String, null: true
    field :created_at , String , null: true

    field :poi, Types::PoiType, null: true
    field :user, Types::UserType, null: false
  end
end
