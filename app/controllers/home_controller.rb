class HomeController < ApplicationController
  def index
  end

  def mongo
    @user = User.first
  end
end
