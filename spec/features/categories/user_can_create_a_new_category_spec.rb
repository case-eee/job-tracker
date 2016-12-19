require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Web Development"

    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
  end

  scenario "a user tries to create a category that already exists" do
    category = Category.create(title: "Web Developer")

    visit new_category_path

    fill_in "category[title]", with: "Web Developer"
    click_button "Create Category"

    expect(current_path).to eq("/categories")
  end
end
