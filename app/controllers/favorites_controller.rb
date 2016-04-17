class FavoritesController < ApplicationController

  def new
  end

  def create
    current_user.favorites.create(user_id: :id, gif_id: params[:gif_id])

    redirect_to gifs_path
  end

  def destroy
    current_user.favorites.find_by(params[:id]).delete
    redirect_to user_path(current_user)
  end

end
