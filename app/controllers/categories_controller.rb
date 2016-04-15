class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:name])
  end

  def index
    @categories = Category.all
  end

end
