class Place
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :image_urls, type: Array
  field :coordinate, type: Coordinate

  belongs_to :user
  

  Coordinate = Struct.new(:lat, :lon)

  enum type: {
    workshop: 0,
    food: 1,
    rest: 2,
  }

  TYPES = {
    workshop: {
      icon: 'src/path/to/icon.svg',
      description: ''
    },
    food: {
      icon: 'src/path/to/icon.svg',
      description: ''
    },
    rest: {
      icon: 'src/path/to/icon.svg',
      description: ''
    }
  }
end
