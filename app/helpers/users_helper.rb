module UsersHelper

  def favorite_id(user_id, gif_id)
    User.find(user_id).favorites.find_by(user_id: user_id, gif_id: gif_id).id
  end

end
