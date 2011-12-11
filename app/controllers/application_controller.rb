class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin
    redirect_to new_admin_sessions_path unless current_user.try(:admin?)
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
