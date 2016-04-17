require 'rails_helper'

RSpec.feature "User can favorite gifs" do
    scenario "User sees a button to favorite a gif on the gif show page" do

      user = User.create(username: "jbern", password: "password")
      gif = create(:gif)

      visit gif_path(gif)

      expect(page).to have_button "Favorite"
  end

    scenario "when a user favorites a gif tha gif is shown on their show page" do
      user = User.create(username: "jbern", password: "password")
      gif = create(:gif)

      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit gif_path(gif)

      click_on "Favorite"

      visit user_path(user)

      expect(page).to have_xpath("//img[@src=\"#{gif.image_path}\"]")
    end
    scenario "a user can unfavorite a gif and delete it from their page" do
      user = User.create(username: "jbern", password: "password")
      gif = create(:gif)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      user.favorites.create(user_id: :id, gif_id: gif.id)

      visit user_path(user)

      click_on "Unfavorite"
      
      expect(page).to_not have_xpath("//img[@src=\"#{gif.image_path}\"]")
    end
  end
