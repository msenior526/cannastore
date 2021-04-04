class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.new
        byebug
        if user && user.authenticate(params)
            redirect_to user
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
