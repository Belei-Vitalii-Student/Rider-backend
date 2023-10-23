class Place
  include Mongoid::Document
  include Mongoid::Timestamps

  # Coordinate = Struct.new(:lat, :lon)

  field :title, type: String
  field :description, type: String
  field :image_urls, type: Array
  field :coordinate, type: Object
  field :type, type: Enums::PlaceType

  # belongs_to :user
  


  # enum type: {
  #   workshop: 0,
  #   food: 1,
  #   rest: 2,
  # }

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
