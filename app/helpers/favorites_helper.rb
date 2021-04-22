module FavoritesHelper

    def favorite_button
        if logged_in?
            render partial: 'favorites/form'
        end 
    end

    def display_favorites(favorites)
        if favorites.empty?
            content_tag(:p, "You have not favorited any strains yet.")
        else
            render partial: 'strains/strain', collection: favorites
        end
    end
end