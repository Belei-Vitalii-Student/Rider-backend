class TrafficLight
  include Mongoid::Document
  include Mongoid::Timestamps

  Coordinate = Struct.new(:lat, :lon)

  field :coordinate, type: Coordinate

  belongs_to :user

end
