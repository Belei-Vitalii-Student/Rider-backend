User.create(
    email: "simple@email.com",
    name: "Vitalii",
    username: "Userlocal",
    places: [
        Place.create(
            title: "My title",
            description: "Description of place",
            image_urls: ["url1", "url2"],
            coordinate: {lat: 22.44, lng: 23.222222242535335},
            type: "food",
        )
    ],
    paths: [
        Path.create(
            coordinates: [
                {lat: 22.553566, lng: 25.463637},
                {lat: 22.646475, lng: 25.5325235},
                {lat: 22.112, lng: 25.656},
                {lat: 22.3568, lng: 25.44423},
                {lat: 22.3325, lng: 25.2245},
                {lat: 22.3331, lng: 25.78686},
                {lat: 22.57979, lng: 25.12414},
            ],
            user: "6538c90a8f23602c5076c7c9"
        )
    ],
    traffic_lights: [
        TrafficLight.create(coordinate: {lat: 24.55363, lng: 22.253465546}),
        TrafficLight.new(coordinate: {lat: 25.12424, lng: 23.245}),
        TrafficLight.new(coordinate: {lat: 24.222, lng: 25.3567}),
        TrafficLight.new(coordinate: {lat: 21.25325, lng: 23.3526}),
    ]
)


User.create(
    email: "simple@email.com",
    name: "Vitalii",
    username: "Userlocal")
