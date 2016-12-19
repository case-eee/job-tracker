require 'rails_helper'

describe "User can edit category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "Janitorial")

    visit categories_path

    click_on "Edit"
    fill_in "category[title]", with: "New Category"
    click_on "Update Category"

    expect(page).to have_content("New Category")
    expect(page).to_not have_content(category.title)
    expect(current_path).to eq(category_path(category))
  end
end