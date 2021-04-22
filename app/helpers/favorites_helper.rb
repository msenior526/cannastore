module FavoritesHelper

    def favorite_button
        if logged_in?
            render partial: 'favorites/form'
        end 
    end
end