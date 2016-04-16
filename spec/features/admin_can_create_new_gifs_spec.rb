require 'rails_helper'

RSpec.feature "Admin can create gifs" do
  scenario "an users show page sees a button to create new gif if admin" do

    user = User.create(username: "jbern", password: "password", role: 1)

    visit user_path(user)

    expect(page).to have_button "Create Gif"
  end
    scenario "a regular user can not see a button to create new gif" do

      user = User.create(username: "jbern", password: "password")

      visit user_path(user)

      expect(page).not_to have_button "Create Gif"
  end
    scenario "an admin can add a new gifs to the database" do

    admin = User.create(username: "jbern", password: "password", role: 1)

    visit user_path(admin)
    


end
