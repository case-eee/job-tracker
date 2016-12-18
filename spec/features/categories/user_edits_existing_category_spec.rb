require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Internet Engineering")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Web Development"
    click_button "Update Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Web Development")
    expect(page).to_not have_content("Internet Engineering")
  end
end
