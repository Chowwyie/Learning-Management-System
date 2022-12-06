# frozen_string_literal: true

##
# Session controller that controls all session related manipulations and functions.
# Main purpose is authetication and authorizations
class SessionsController < ApplicationController
  def new; end

  def create
    # case-insensitive
    user = User.find_by(email: params[:session][:email].downcase)
    # autheticates user
    if user&.authenticate(params[:session][:password])
      start_session(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    # ends session
    log_out
    redirect_to root_url, status: :see_other
  end
end

def start_session(user)
  # reset session to prevent session anomalies.
  reset_session
  log_in user
  redirect_to announcements_path
end
