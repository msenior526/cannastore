class FavoritesController < ApplicationController
    def index
        if logged_in?
            @favorites = current_user.favorites
        else
            redirect_if_not_logged_in
        end
    end

    def create
        @strain = Strain.find_by(id: params[:strain_id])
        add_or_remove_favorite(current_user, @strain)
        redirect_to user_favorites_path(current_user)
    end

    private

    def favorite_params
        params.permit(:user_id, :strain_id)
    end

    def add_or_remove_favorite(user, strain)
        if !user.favorites.include?(strain)
            FavoriteStrain.create(favorite_params)
        else
            FavoriteStrain.where(["user_id = ? and strain_id = ?", user.id, strain.id]).delete_all
        end
    end
end