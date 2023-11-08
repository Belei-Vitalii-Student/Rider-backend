module Inputs
  class CoordinateInput < Types::BaseInputObject
    argument :lat, Float
    argument :lng, Float
  end
end
