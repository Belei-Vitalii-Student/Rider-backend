class TrafficLight
  include Mongoid::Document
  include Mongoid::Timestamps

  field :coordinate, type: Coordinate

  belongs_to :user


  Coordinate = Struct.new(:lat, :lon)
  
end
