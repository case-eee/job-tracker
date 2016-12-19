require 'rails_helper'

describe "Category titles must be unique" do
  scenario "user tries to create a category with an existing title" do
    category = "Web Developer"
    Category.create(title: category)

    visit new_category_path

    expect(page).to have_content("Create a new category!")

    fill_in "category[title]", with: category

    click_button "Create Category"


    expect(current_path).to eq(categories_path)
    expect(page).to have_content("1 error prohibited this record from being saved:")
    expect(page).to have_content("Title has already been taken")
  end
end
