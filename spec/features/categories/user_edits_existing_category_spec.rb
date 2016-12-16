require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "HR")
    visit categories_path
    
    expect(page).to have_content("HR")
    click_on "Edit"

    fill_in "category[title]", with: "CEO"
    click_button "Update"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("CEO")
    expect(page).to_not have_content("HR")
  end
end
