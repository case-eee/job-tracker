require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "HR")
    visit category_path(category)

    click_link "Delete"

    expect(page).to have_content("HR was successfully deleted!")
    expect(Category.all.count).to eq(0)
  end
end
