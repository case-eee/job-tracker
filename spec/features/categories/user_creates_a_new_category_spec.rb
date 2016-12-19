require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[title]", with: "Janitorial"
    click_on "Create Category"

    expect(page).to have_content "Janitorial"
    expect(current_path).to eq(category_path(Category.last.id))
  end

  scenario "a user returns to form if they try to create duplicate" do
    visit new_category_path

    fill_in "category[title]", with: "Janitorial"
    click_on "Create Category"

    visit new_category_path

    fill_in "category[title]", with: "Janitorial"
    click_on "Create Category"

    expect(page).to have_content("Create a New Category")
    expect(current_path).to eq(categories_path)
  end
end