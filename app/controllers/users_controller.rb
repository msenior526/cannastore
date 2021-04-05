class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show, :edit]

    def new
       redirect_if_logged_in
        @user = User.new
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
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :birthday, :password, :password_confirmation)
    end


end
