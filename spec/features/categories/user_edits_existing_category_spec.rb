require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create(title: "Cats")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Dogs"
    click_button "Submit"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Dogs")
    expect(page).to_not have_content("Cats")
  end
end
