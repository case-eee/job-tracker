require 'rails_helper'

describe "User creates a new category" do
  scenario "successfully with a unique title" do
    visit new_category_path

    fill_in "category[title]", with: "partying"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("partying")
   expect(Category.count).to eq(1)
  end

  scenario "unsuccessfully with a repeat title" do
    Category.create(title:"partying")
    visit new_category_path

    fill_in "category[title]", with: "partying"
    click_button "Create"

    expect(page).to have_content("Please enter a unique category")
    expect(Category.count).to eq(1)
  end
end