require 'rails_helper'

describe "Editing a Category cannot result in two categories with same title" do
  scenario "User tries to update a category" do
    category_1 = Category.first
    category_2 = Category.all[1]

    visit categories_path
    expect(page).to have_content "All Categories"

    first(:link, "Edit").click

    expect(current_path).to eq(edit_category_path(category_1))

    fill_in "category[title]", with: category_2.title
    click_button "Update Category"

    expect(page).to have_content("1 error prohibited this record from being saved:")
    expect(page).to have_content "Title has already been taken"
  end
end
