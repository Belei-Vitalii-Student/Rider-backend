class Place
  include Mongoid::Document
  include Mongoid::Timestamps

  Coordinate = Struct.new(:lat, :lng)

  field :title, type: String
  field :description, type: String
  field :image_urls, type: Array
  field :coordinate, type: Coordinate
  field :type, type: Enums::PlaceType

  belongs_to :user, required: true

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
