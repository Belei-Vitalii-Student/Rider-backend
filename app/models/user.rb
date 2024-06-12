class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :name, type: String
  field :username, type: String
  field :picture, type: String

  has_many :pois
  has_many :feedbacks
  has_and_belongs_to_many :friends, class_name: 'User', inverse_of: :friend_ids

  def add_friend(friend)
    unless self.friends.include?(friend) || self == friend
      self.friends << friend
      friend.friends << self
    end
  end

  def remove_friend(friend)
    if self.friends.include?(friend)
      self.friends.delete(friend)
      friend.friends.delete(self)
    end
  end

end
