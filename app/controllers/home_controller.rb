class HomeController < ApplicationController
  def index
  end

  def mongo
    @user = User.create(
      username: "STUDENT",
      places: [Place.new(title: "Title", description: "DESC", image_urls: ["path/to/image.png"], coordinate: {lat: 22.455365, lng: 24.5353}, type: "food")]
      )
  end
end
