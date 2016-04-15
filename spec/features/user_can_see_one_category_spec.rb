require 'rails_helper'

RSpec.feature "User can see one category" do
  scenario "they see a page with all the gifs from that category" do

    gif_one = create(:gif)

    visit category_path(gif_one.category)

    expect(current_path).to eq category_path(gif_one.category)

    expect(page).to have_content gif_one.category.name
    expect(page).to have_xpath("//img[@src=\"#{gif_one.image_path}\"]")
  end
end
