class ReviewsController < ApplicationController
    def new
        redirect_if_not_logged_in
        if params[:strain_id] && !Strain.exists?(params[:strain_id])
            redirect_to strains_path, alert: "Strain not found."
          else
            @review = Review.new(strain_id: params[:strain_id], user_id: session[:user_id])
          end
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to strain_reviews_path
        else
            render :new
        end
    end

    def index
        if params[:strain_id]
            @strain = Strain.find(params[:strain_id])
            @reviews = Strain.find(params[:strain_id]).reviews
        else
            @reviews = Review.all
        end
    end

    private

    def review_params
        params.require(:review).permit(:context, :rating, :user_id, :strain_id)
    end
end
