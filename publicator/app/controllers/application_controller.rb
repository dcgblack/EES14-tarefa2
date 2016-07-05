class ApplicationController < ActionController::Base

  delegate :current_user, :user_signed_in?, to: :user_session
  helper_method :current_user, :user_signed_in?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_session
    UserSession.new(session)
  end

  def require_authentication
    unless user_signed_in?
      redirect_to new_user_sessions_path,
        alert: "Login is required"
    end
  end

  def require_no_authentication
    if user_signed_in?
      redirect_to root_path,
        notice: "Already logged"
    end
  end
end
