class FavoritesController < ApplicationController
    def index
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @favorites = @user.favorites
        else
            redirect_if_not_logged_in
        end
    end
end