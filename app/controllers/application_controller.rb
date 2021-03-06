class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #code
  end
  helper_method :current_user

  def user_is_owner
    @restaurant.owner_id == current_user.id if current_user
#code
  end
  helper_method :user_is_owner

  


end
