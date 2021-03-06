class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :auth

  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def auth
    unless session[:user_id]
      redirect_to "/auth/yammer"
    end
  end
end
