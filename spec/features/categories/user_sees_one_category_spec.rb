require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create(title: "Cats")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Cats")
    expect(page).to have_content("Back to all Categories")
  end
end
