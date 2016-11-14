class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  def user_signed_in?
    session[:user_id].present? && user_valid?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    (redirect_to new_session_path, alert: "Please sign in first") unless user_signed_in?
  end
  helper_method :authenticate_user!

  def user_valid?
    if User.find_by(id: session[:user_id]).present?
      true
    else
      reset_session
      false
    end
  end


end
