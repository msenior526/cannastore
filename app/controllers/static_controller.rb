class StaticController < ApplicationController
    def home
        if params[:choice] == "yes"
            redirect_to strains_path
        elsif params[:choice] == "no"
            flash.now[:alert] = "You must be 21 to enter!"
            render :home
        end
    end

    def contact
    end

    def about
    end
end
