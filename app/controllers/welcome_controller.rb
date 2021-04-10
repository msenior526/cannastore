class WelcomeController < ApplicationController
    def home
        if params[:choice] == "yes"
            session[:choice_id]
            redirect_to strains_path
        elsif params[:choice] == "no"
            redirect_to :home, alert: "You must be 21 to enter!"
        end
    end
end