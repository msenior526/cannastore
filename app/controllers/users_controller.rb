class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show, :edit]

    def new
       redirect_if_logged_in
        @user = User.new
    end

    def create
        user = User.new(user_params(:username, :email, :birthday, :password, :password_confirmation))
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
        if @user.update(user_params(:username, :password, :password_confirmation))
            redirect_to user_path(@user)
        else 
            render :edit
        end
    end

    def destroy
        @user = current_user
        @user.delete
        session.clear
        redirect_to login_path
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end


end
