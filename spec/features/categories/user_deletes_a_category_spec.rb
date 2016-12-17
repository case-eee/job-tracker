require 'rails_helper'

describe "User deletes existing cateogry" do
  scenario "a user can delete a category" do
    category1 = Category.create(name: "Education")
    category2 = Category.create(name: "Technology")

    visit categories_path
    within(".category_#{category1.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Education was successfully deleted!")
  end
end
