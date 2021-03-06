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
            redirect_to strain_reviews_path, notice: "Your new review was created!"
        else
            render :new
        end
    end

    def index
        if params[:strain_id]
            find_strain
            @reviews = @strain.reviews
        else
            @reviews = Review.all
        end
    end

    def destroy
        if params[:strain_id]
            find_strain
            if @strain.nil?
                redirect_to strains_path, alert: "Strain not found."
            else
                @review = @strain.reviews.find_by(id: params[:id]).destroy
                redirect_back fallback_location: current_user, notice: "You have successfully deleted your review!"
            end
        end
    end

    private

    def review_params
        params.require(:review).permit(:context, :rating, :user_id, :strain_id)
    end

    def find_strain
        @strain = Strain.find(params[:strain_id])
    end
end
