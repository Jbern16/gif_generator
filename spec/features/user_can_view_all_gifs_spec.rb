require 'rails_helper'

RSpec.feature "User can view all gifs" do
  scenario "they see a page showing all gifs" do

    gif_one, gif_two = create_list(:gif, 2)

    visit gifs_path

    expect(page).to have_xpath("//img[@src=\"#{gif_one.image_path}\"]")
    expect(page).to have_xpath("//img[@src=\"#{gif_two.image_path}\"]")
    expect(page).to have_link gif_one.image_path, href: gif_path(gif_one)
    expect(page).to have_link gif_two.image_path, href: gif_path(gif_two)
  end
end
