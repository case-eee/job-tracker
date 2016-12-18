require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category_1 = Category.create(title: "Web Developer")
    category_2 = Category.create(title: "Fire Fighter")
    category_3 = Category.create(title: "Teacher")
    visit categories_path

    within(".category_#{category_1.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Web Developer was successfully deleted!")
  end
end
