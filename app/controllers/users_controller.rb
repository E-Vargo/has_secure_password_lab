class UsersController < ApplicationController
    def new
    end

    def create

        @user = User.create(user_params)
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id

            redirect_to(controller: 'users', action: 'new')
 
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
