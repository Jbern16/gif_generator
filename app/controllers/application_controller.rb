class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_logged_in?, :current_user

  def user_logged_in?
    !session[:user_id].nil?
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
