require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all categories" do
    category   = Category.create(name: "Web Developer")
    category_2 = Category.create(name: "Financial Analyst")

    visit(categories_path)

    expect(page).to have_content("Web Developer")
    expect(page).to have_content("Financial Analyst")
  end
end
