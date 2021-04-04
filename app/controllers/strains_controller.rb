class StrainsController < ApplicationController
    def index
        @strains = Strain.all
    end

    def show
       @strain = Strain.find_by_id(params[:id])
    end
end
