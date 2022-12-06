class UsersController < ApplicationController
  before_action :authorize_user?, only: [:index]
  layout "dashboard", except: [:new]

  def index
  end

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
      flash[:success] = "#{User.name} added!"
      redirect_to login_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    name = @user.name
    @user.update_attribute(:admin,true)
    flash[:success] = "#{name} is now an admin!"
    redirect_to users_path
  end

  def destroy
    name = User.find(params[:id]).name
    User.find(params[:id]).destroy
    flash[:success] = "User #{name} dropped"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def authorized?
      @user.admin
    end
end
