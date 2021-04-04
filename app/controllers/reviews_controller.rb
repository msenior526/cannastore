class ReviewsController < ApplicationController
    def new
        redirect_if_not_logged_in
        if params[:strain_id] && !Strain.exists?(params[:strain_id])
            redirect_to strains_path, alert: "Strain not found."
          else
            @review = Review.new(strain_id: params[:strain_id])
          end
    end

    def create
        @review = Review.new(review_params)
        @review.save
        redirect_to review_path(@review)
    end

    def index
        if params[:strain_id]
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
