class StrainsController < ApplicationController

    def new
        @strain = Strain.new
    end

    def create
        strain = Strain.new(strain_params)
        if strain.save
            redirect_to strain_path(strain)
        else
            render :new
        end
    end

    def index
        @strains = Strain.all
    end

    def show
       @strain = Strain.find_by_id(params[:id])
    end

    private

    def strain_params
        params.require(:strain).permit(:name, :description, :thc_content, :category_id)
    end
end
