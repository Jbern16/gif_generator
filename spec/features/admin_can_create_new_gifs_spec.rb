require 'rails_helper'

RSpec.feature "Admin can create gifs" do
  scenario "an users show page sees a button to create new gif if admin" do

    user = User.create(username: "jbern", password: "password", role: 1)

    visit user_path(user)

    expect(page).to have_link "Create Gif"
  end
    scenario "a regular user can not see a button to create new gif" do

      user = User.create(username: "jbern", password: "password")

      visit user_path(user)

      expect(page).not_to have_link "Create Gif"
  end
    scenario "an admin can add a new gifs to the database by category" do

      admin = User.create(username: "jbern", password: "password", role: 1)

      visit user_path(admin)
      click_on "Create Gif"

      expect(current_path).to eq new_admin_gif_path

      fill_in 'Category Name', with: "puppy"

      click_on "Create Gifs"

      expect(current_path).to eq categories_path
      expect(page).to have_content "puppy"
  end
end
