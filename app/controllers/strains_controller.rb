class StrainsController < ApplicationController

    def new
    end

    def create
    end

    def index
        @strains = Strain.all
    end

    def show
       @strain = Strain.find_by_id(params[:id])
    end
end
