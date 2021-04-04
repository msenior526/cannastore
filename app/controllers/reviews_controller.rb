class ReviewsController < ApplicationController
    def new
        redirect_if_not_logged_in
        @review = Review.new
    end

    def create
    end

    private

    def review_params
        params.require(:review).permit(:context, :rating, :user_id, :strain_id)
    end
end
