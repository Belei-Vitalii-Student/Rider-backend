class Place
  include Mongoid::Document
  include Mongoid::Timestamps

  Coordinate = Struct.new(:lat, :lng)

  field :title, type: String
  field :description, type: String
  field :image_urls, type: Array
  field :coordinate, type: Coordinate
  field :type, type: Array

  belongs_to :user, required: true
  has_many :feedbacks, as: :poi, dependent: :destroy

  TYPES = {
    workshop: {
      icon: 'src/path/to/icon.svg',
      description: 'Place where you can repair your bike'
    },
    food: {
      icon: 'src/path/to/icon.svg',
      description: 'Place where you can have a meal'
    },
    rest: {
      icon: 'src/path/to/icon.svg',
      description: 'Place where you can rest and recover'
    }
  }
end
