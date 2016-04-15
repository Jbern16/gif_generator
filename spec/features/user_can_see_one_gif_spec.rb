require "rails_helper"

RSpec.feature "User can see one gif" do
  scenario "they see a page showing one gif" do

    gif_one = create(:gif)

    visit gifs_path

    click_link gif_one.image_path

    expect(current_path).to eq gif_path(gif_one)
    expect(page).to have_xpath("//img[@src=\"#{gif_one.image_path}\"]")
  end
end
