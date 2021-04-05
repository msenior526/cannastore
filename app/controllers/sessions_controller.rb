class SessionsController < ApplicationController
    def new
       @user = User.new 
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user
        else 
            render :new
        end
    end

    def omniauth
    end

    def destroy
        session.clear
        redirect_to login_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end