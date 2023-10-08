class Path
  include Mongoid::Document
  include Mongoid::Timestamps

  field :coordinates, type: Array

  belongs_to :user
  

  Coordinate = Struct.new(:lat, :lon)

  validates_each :coordinates do |record, attr, value|
    if value.present? && !value.all? { |v| v.is_a?(Coordinate) }
      record.errors.add(attr, "must contain only lat and lon value")
    end
  end
end
