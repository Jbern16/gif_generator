require 'rails_helper'

RSpec.feature "User can create a login" do
  scenario "when a user clicks create account, they see a form to make one" do

    visit gifs_path

    click_link "Create Account"

    expect(current_path).to eq new_user_path

    fill_in "Username", with: "jbern"
    fill_in "Password", with: "password"

    click_on "Create User"
    expect(current_path).to eq login_path
    expect(page).to have_content "Please Log In"
  end
end
