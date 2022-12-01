class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @presentation = Presentation.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def change_password
    @user = User.find(@current_user)
    current_password = params[:user][:current_password]
    user = User.authenticate(@user.email, current_password)
    if @user && user
      user.update_attribute(password: params[:user][:current_password])
      flash[:success] = "Password successfully changed!"
      redirect_to user_path(@current_user)
    else
      flash[:danger] = "Your old password was incorrect. Please try again."
      redirect_to user_path(@current_user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :admin, :password,
                                   :password_confirmation)
    end

    def authorized?
      @user.admin
    end
end
