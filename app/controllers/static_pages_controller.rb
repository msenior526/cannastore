class StaticPagesController < ApplicationController
    def home
        def home
            if params[:choice] == "yes"
                session[:choice_id]
                redirect_to strains_path
            elsif params[:choice] == "no"
                redirect_to :root, alert: "You must be 21 to enter!"
            end
        end
    end

    def contact
    end

    def about
    end
end
