class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps
  field :description, type: String
  field :feedback, type: String
  field :type, type: String
  field :poi_id, type: BSON::ObjectId
  field :user_id, type: BSON::ObjectId

  belongs_to :poi, polymorphic: true
  belongs_to :place, optional: true
  belongs_to :path, optional: true
  belongs_to :user
end
