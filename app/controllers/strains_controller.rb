class StrainsController < ApplicationController

    def new
        @strain = Strain.new
    end

    def create
        @strain = Strain.new(strain_params)
        byebug
        if @strain.save
            redirect_to strain_path(@strain)
        else
            render :new, errors: "Name cNT VE BLANK"
        end
    end

    def index
        if params[:search]
            @strains = Strain.search_by_name(params[:search])
        else
            @strains = Strain.all
        end
    end

    def show
        @user = current_user
        @strain = Strain.find_by_id(params[:id])
    end

    private

    def strain_params
        params.require(:strain).permit(:name, :description, :thc_content, :category_id)
    end
end
