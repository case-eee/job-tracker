require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create(name: "Technology")
    category = Category.create(name: "Education")

    visit categories_path

    expect(page).to have_content("Technology")
    expect(page).to have_content("Education")
  end

end
