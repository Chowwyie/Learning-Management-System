# frozen_string_literal: true

##
# Password controller that controls all password reset functions.
class PasswordResetsController < ApplicationController
  before_action :obtain_user, only: %i[edit update]

  def edit; end

  def update
    @user = obtain_user
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def obtain_user
    @user = User.find_by(email: params[:email])
  end
end
