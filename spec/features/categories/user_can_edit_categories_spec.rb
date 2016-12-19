require 'rails_helper'

describe "Categories can be edited from link on index" do
  scenario "User edits a category" do

    visit categories_path
    expect(page).to have_content("All Categories")

    first(:link, "Edit").click

    expect(current_path).to eq(edit_category_path(Category.first))
    expect(page).to have_content("Editing #{Category.first.title} Category")

    fill_in "category[title]", with: "Edited Category"
    click_button "Update Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Edited Category updated!")
    expect(page).to have_content("Edited Category")
    expect(page).to_not have_content("One")
  end
end
