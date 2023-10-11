# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user.paths[0].points[0].lat

user: {
    ...
    paths: [
        {
            coordinates: [
                [lat, lng]
                [lat, lng]
            ]
        }
    ]
}
class user
    has_many :pathes
end

user.pathes.first.points
place.icon
# column: integer
class Path
    # coordinates: []
    enum type {
        workshop: 0,
        dinner: 10
        ...
    }

    TYPES = {
        workshop: {
            icon: 'asdas',
            description: []
        },
        ...
    }

    def icon
        TYPES[type][:icon]
    end

    
    Coordinate = Struct.new(:lat, :lon)

    def points
        # [[:lat, :lon], [:lat, :lon]]
      _read_attribute(:coordinates).map { |c| Coordinate.new(c[0], c[-1]) }
    end
end

