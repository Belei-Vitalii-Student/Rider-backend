class Path
  include Mongoid::Document
  include Mongoid::Timestamps

  Coordinate = Struct.new(:lat, :lng)

  field :coordinates, type: Array

  belongs_to :user

  validates_each :coordinates do |record, attr, value|
    if value.present? && !value.all? { |v| v.is_a?(Coordinate) }
      record.errors.add(attr, "must contain only lat and lng value")
    end
  end
end
