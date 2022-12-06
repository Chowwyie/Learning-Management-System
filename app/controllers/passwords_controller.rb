class PasswordsController < ApplicationController

    def edit
    end

    def update
        if @user.update(password_params)
            redirect_to root_path, notice: "Password Updated"
        else
            render :edit
        end
    end

    private

        def password_params
            params.reqire(:user).permit(:password, :password_confirmation)
        end
end
