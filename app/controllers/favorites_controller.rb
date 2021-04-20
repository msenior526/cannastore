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
        add_or_remove_favorite(@user, @strain)
        redirect_to user_favorites_path(@user)
    end

    private

    def favorite_params
        params.permit(:user_id, :strain_id)
    end
end