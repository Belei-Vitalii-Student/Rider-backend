class Enums::PlaceType 
    extend MongoEnum

    MAPPING = {
        'admin' => 0,
        'user' => 1,
    }.freeze
end