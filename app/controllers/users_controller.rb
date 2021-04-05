class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if logged_in?
            redirect_to current_user
        else 
            @user = User.new
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user
        else
            render :new
        end
    end

    def show
        @user = current_user
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :birthday, :password, :password_confirmation)
    end


end
