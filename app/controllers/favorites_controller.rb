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
end