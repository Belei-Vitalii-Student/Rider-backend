class TrafficLight
  include Mongoid::Document
  include Mongoid::Timestamps

  Coordinate = Struct.new(:lat, :lng)

  field :coordinate, type: Coordinate

  belongs_to :user

end
