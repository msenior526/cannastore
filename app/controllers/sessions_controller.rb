class SessionsController < ApplicationController
    def new
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            redirect_to user
        else 
            render :new
        end
    end

    def create
    end

    def destroy
    end
end