class HomeController < ApplicationController
  skip_before_action :require_authentication
  def show
    @joke = Joke.random_display
  end
end
