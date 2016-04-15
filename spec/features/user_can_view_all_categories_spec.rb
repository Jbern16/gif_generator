require 'rails_helper'

RSpec.feature "User can view all categories" do
  scenario "they see a page showing all categoies as links and a random gif
            from that category" do


  gif_one, gif_two = create_list(:gif, 2)


  visit categories_path

  save_and_open_page

  expect(page).to have_link gif_one.category.name,
    href: category_path(gif_one.category)
  expect(page).to have_link gif_two.category.name,
    href: category_path(gif_two.category)
  end
end
