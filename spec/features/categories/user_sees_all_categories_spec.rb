require 'rails_helper'

describe "User sees all categories" do
  scenario "a user views categories index page" do
    category1 = Category.create(title: "Web Development")
    category2 = Category.create(title: "Education")

    visit categories_path

    expect(page).to have_content("All Categories")
    expect(page).to have_content("Web Development")
    expect(page).to have_content("Education")
  end
end
