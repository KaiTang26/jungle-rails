class Admin::CategoriesController < ApplicationController

    http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']

    def new
    end

    def create
        @category = Category.new(params[:category].permit(:name))
        
        if @category.save
            
            redirect_to admin_categories_path
        else
            render 'new'
        end
    end

    def index
        @categories = Category.all
    end

end
