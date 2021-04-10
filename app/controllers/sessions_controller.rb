class SessionsController < ApplicationController
    def new
        redirect_if_logged_in
       @user = User.new 
    end

    def create
        if params[:user].nil?
            render :new
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to @user
            else
                render :new
            end
        end
    end

    def omniauth
        @user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:name].downcase.gsub(" ", "_")
            u.birthday = DateTime.now.strftime("%Y-%m-%d")
            u.password = SecureRandom.hex(20)
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end

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