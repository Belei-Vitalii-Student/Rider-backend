class Enums::PlaceType
    extend MongoEnum

    MAPPING = {
        'workshop' => 0,
        'food' => 1,
        'rest' => 2,
        'parking' => 3
    }.freeze
end
