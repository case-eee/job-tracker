require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_one, category_two = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content(category_one.title)
    expect(page).to have_content(category_two.title)
  end

  scenario "a user can click category link" do
    category_one, category_two = create_list(:category, 2)

    visit categories_path

    expect(page).to have_link(category_one.title, category_path(category_one))
    expect(page).to have_link(category_two.title, category_path(category_two))
  end

end
