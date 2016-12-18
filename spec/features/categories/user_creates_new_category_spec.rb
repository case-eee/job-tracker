require 'rails_helper'

describe "User clicks on new Category" do
  scenario "and can create new category" do
    visit "/"

    click_on "Add Category"
    fill_in "category[name]", with: "New"
    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("New")
  end
end