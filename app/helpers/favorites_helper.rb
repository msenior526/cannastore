module FavoritesHelper

    def add_or_remove_favorite(user, strain)
        if !user.favorites.include?(strain)
            FavoriteStrain.create(favorite_params)
        else
            FavoriteStrain.where(["user_id = ? and strain_id = ?", user.id, strain.id]).delete_all
        end
    end
end