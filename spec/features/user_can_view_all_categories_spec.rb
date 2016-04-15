require 'rails_helper'

RSpec.feature "User can view all categories" do
  scenario "they see a page showing all categoies as links and a random gif
            from that category" do


    gif_one, gif_two = create_list(:gif, 2)


    visit categories_path

    expect(page).to have_link gif_one.category.name,
      href: category_path(gif_one.category)
    expect(page).to have_link gif_two.category.name,
      href: category_path(gif_two.category)
  end
  scenario "when a category is clicked user is brought to the category show page" do

    gif_one = create(:gif)

    visit categories_path

    click_link gif_one.category.name

    expect(current_path).to eq category_path(gif_one.category)
  end
end
