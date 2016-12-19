require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Dogs"

    click_button "Submit"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Dogs")

  end
  scenario "the user tries to create a category that already exists" do
    category1 = Category.create(title: "Cats")
    visit new_category_path

    fill_in "category[title]", with: "Cats"

    click_button "Submit"

    expect(page).to have_content("Create a new Category")
  end

end
