require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "agricultural"
    click_button "Create"

    expect(page).to have_content("agricultural")
    expect(Category.count).to eq(1)
  end
end