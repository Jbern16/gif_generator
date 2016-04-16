RSpec.feature "User can Login and Logout" do
  scenario "existing user can login and see their page" do

    user = User.create(username: "jbern", password: "password")

    visit gifs_path

    click_link "Log In"

    expect(current_path).to eq login_path

    fill_in "Username", with: "jbern"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Log In"
    end

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "Welcome"
  end
  scenario "user can logout" do
    user = User.create(username: "jbern", password: "password")

    visit gifs_path

    click_link "Log In"

    fill_in "Username", with: "jbern"
    fill_in "Password", with: "password"

    within ".login" do
      click_on "Log In"
    end
    click_on "Log Out"

    
    expect(page).not_to have_link "Log Out"
    expect(page).to have_content "Log In"
    expect(current_path).to eq gifs_path
  end
end
