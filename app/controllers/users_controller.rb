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

  def update
    @user = User.find(params[:id])
    @user.update(update_params)
    redirect_to current_user
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
