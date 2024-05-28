class Poi
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :address, type: String
  field :description, type: String
  field :image_urls, type: Array
  field :coordinates, type: Array
  field :type, type: String
  field :types, type: Array

  belongs_to :user, required: true
  has_many :feedbacks, dependent: :destroy

  TYPES = {
    place: {
      icon: 'src/path/to/icon.svg',
      description: 'Place of interest'
    },
    path: {
      icon: 'src/path/to/icon.svg',
      description: 'Path or route'
    }
  }

  validates :type, inclusion: { in: TYPES.keys.map(&:to_s) }
end
