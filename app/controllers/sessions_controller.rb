class SessionsController < ApplicationController
    def new 
    end

    def create
        if params[:user][:name] && params[:user][:password]
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        else
            redirect_to(controller: 'sessions', action: 'new')
        end
    end

    def destroy
        session.delete(:name)
    end
end
