require 'rails_helper'

describe "User can create a new Category by filling out a form" do
  scenario "user fills out a category form" do
    category = "Web Developer"
    visit new_category_path

    fill_in "category[title]", with: category

    click_button "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("New #{category} Category Created!")
    expect(page).to have_content("All Categories")
    expect(page).to have_content(category)
  end
end
