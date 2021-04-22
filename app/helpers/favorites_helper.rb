module FavoritesHelper

    def add_or_remove_favorite(user, strain)
        if !user.favorites.include?(strain)
            FavoriteStrain.create(favorite_params)
        else
            FavoriteStrain.where(["user_id = ? and strain_id = ?", user.id, strain.id]).delete_all
        end
    end

    def favorite_button
        if logged_in?
            render partial: 'favorites/form'
        end 
    end

    def display_favorites(favorites)
            render partial: 'strains/strain', collection: favorites
    end
end