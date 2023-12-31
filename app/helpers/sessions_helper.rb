# frozen_string_literal: true

##
# Helper utility functions that are related to the Sessions controller
module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def authorize_user?
    redirect_to root_url unless logged_in?
  end

  def authorize_student?
    redirect_to root_url unless logged_in? && !current_user.admin
  end

  def authorize_admin?
    redirect_to root_url unless logged_in? && current_user.admin
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end
