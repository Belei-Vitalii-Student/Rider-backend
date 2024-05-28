class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :name, type: String
  field :username, type: String

  has_many :pois
  has_many :feedbacks

end
