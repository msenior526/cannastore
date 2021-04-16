class SessionsController < ApplicationController
    def new
        redirect_if_logged_in
       @user = User.new 
    end

    def create
        # if params[:user].nil?
        #     render :new
        # else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                log_in @user
                redirect_to @user, notice: "You have successfully logged in!"
            else
                flash.now[:alert] =  "Invalid credentials." 
                render :new
            end
        # end
    end

    def omniauth
        @user = omniauth_user
        if @user.valid?
            log_in @user
            redirect_to @user, notice: "You have successfully logged in!"
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

    def log_in(user)
        session[:user_id] = user.id
    end

    def omniauth_user
        User.find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:name].downcase.gsub(" ", "_")
            u.password = SecureRandom.hex(20)
        end
    end
end