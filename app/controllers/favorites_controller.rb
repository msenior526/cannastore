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
        if !@user.favorites.include?(@strain)
            favorite = FavoriteStrain.create(user_id: params[:user_id], strain_id: @strain.id)
            redirect_to user_favorites_path(@user)
        else 
             FavoriteStrain.where(["user_id = ? and strain_id = ?", @user.id, @strain.id]).delete_all
             redirect_to user_favorites_path(@user)
        end
    end
end