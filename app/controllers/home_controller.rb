class HomeController < ApplicationController
  skip_before_action :require_authentication
  def show
  end
end
