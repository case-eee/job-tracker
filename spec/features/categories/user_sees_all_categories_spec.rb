require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "HR")
    category_two = Category.create!(title: "CEO")

    visit categories_path

    expect(page).to have_content("HR")
    expect(page).to have_content("CEO")
  end

end
