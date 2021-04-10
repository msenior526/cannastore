class FavoritesController < ApplicationController
    def index
        if logged_in?
            @user = User.find_by(id: session[:user_id])
            @favorites = @user.favorites
        else
            redirect_if_not_logged_in
        end
    end

    def create
        @user = current_user
        @strain = Strain.find_by(id: params[:strain_id])
        if add_favorite(@user, @strain)
            redirect_to user_favorites_path(@user)
        else 
            remove_favorite(@user, @strain)
            redirect_to user_favorites_path(@user)
        end
    end

    private

    def remove_favorite(user, strain)
        FavoriteStrain.where(["user_id = ? and strain_id = ?", user.id, strain.id]).delete_all
    end

    def add_favorite(user, strain)
        if !user.favorites.include?(strain)
            FavoriteStrain.create(user_id: user.id, strain_id: strain.id)
        end
    end
end