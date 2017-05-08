class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :require_authentication

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_authentication
    redirect_to root_path unless current_user
  end
end
