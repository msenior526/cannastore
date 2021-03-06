class StrainsController < ApplicationController
    before_action :find_strain, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in, except: [:show, :index, :most_reviewed]


    def new
        @strain = Strain.new
    end

    def create
        @strain = Strain.new(strain_params)
        if @strain.save
            redirect_to strain_path(@strain), notice: "You have sucessfully created a strain!"
        else
            render :new
        end
    end

    def index
        if params[:search]
            @strains = Strain.search_by_name(params[:search])
                if @strains.empty?
                    flash.now[:alert] = "NO STRAINS FOUND"
                end
        else
            @strains = Strain.all
        end
    end

    def show
        @user = current_user
    end

    def edit
    end

    def update
        if @strain.update(strain_params)
            redirect_to strain_path(@strain)
        else 
            render :edit
        end
    end

    def destroy
        @strain.destroy
        redirect_to strains_path
    end

    def most_reviewed
        @strain = Strain.most_reviews.first
    end
    
    def alpha
        @strains = Strain.alphabetized_by_name
    end

    private

    def strain_params
        params.require(:strain).permit(:name, :description, :thc_content, :category_id)
    end

    def find_strain
        @strain = Strain.find_by(id: params[:id]) or not_found
    end
end
