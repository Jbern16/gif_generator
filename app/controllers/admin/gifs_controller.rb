class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
  end

  def require_admin
    unless current_user.admin?
      redirect_to "../../public/404"
    end
  end
end
