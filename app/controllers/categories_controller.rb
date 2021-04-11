class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find_by_id(params[:id])
        @strains = @category.strains
    end
end
