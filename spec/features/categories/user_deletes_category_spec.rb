require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete an existing category" do
    category = Category.create(title: "testing")

    visit category_path(category)

    click_link "Delete"

    expect(current_path).to eq("/categories")
    expect(page).to_not have_content("testing")
  end
end
