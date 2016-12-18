require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "menial tasks")
    visit edit_category_path(category)

    fill_in "category[title]", with: "menial, soul-sucking tasks"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("menial, soul-sucking tasks")
    expect(page).to_not have_content("menial tasks")
  end

  scenario "should require a title or prompt an error" do
    category = Category.create!(title: "menial tasks")
    visit edit_category_path(category)

    fill_in "category[title]", with: " "
    click_button "Update"

    expect(page).to have_content("Title can't be blank")
  end
end
