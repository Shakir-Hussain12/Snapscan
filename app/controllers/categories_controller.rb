class CategoriesController < ApplicationController
    before_action :fetch_categories

    def index
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @category = current_user.categories.new
    end

    def create
        @category = current_user.categories.new(category_params)
        if @category.save
            redirect_to categories_path, notice: t('.success')
        else
            redirect_to new_category_path, alert: t('.failure')
        end
    end

    private
    def fetch_categories
        @categories = current_user.categories.order(created_at: :desc)
    end

    def category_params
        params.require(:category).permit(:name, :icon)
    end

end
