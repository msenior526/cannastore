class StrainsController < ApplicationController

    def new
        @strain = Strain.new
    end

    def create
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
