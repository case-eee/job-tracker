require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_one = Category.create!(title: "Clerical")
    category_two = Category.create!(title: "Web Development")

    visit categories_path

    expect(page).to have_content("Clerical")
    expect(page).to have_content("Web Development")

    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end

end
