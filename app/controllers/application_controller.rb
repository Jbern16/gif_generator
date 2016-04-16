class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_logged_in?

  def user_logged_in?
    !session[:user_id].nil?
  end


end
