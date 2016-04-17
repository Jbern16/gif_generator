class Admin::GifsController < ApplicationController
  before_action :require_admin

  include ApplicationHelper

  def new
  end

  def create
    category = Category.create(name: params[:category_name])
    gifs = all_gifs(params[:category_name])

    gifs.each do |gif_path|
      Gif.create(image_path: gif_path, category_id: category.id)
    end

    redirect_to categories_path
  end

  def require_admin
    unless current_user.admin?
      redirect_to "../../public/404"
    end
  end
end
