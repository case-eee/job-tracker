require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create(name: "Web Developer")

    visit category_path(category)

    expect(page).to have_content(category.name)
  end

  scenario "user returns to categories index" do
    category = Category.create(name: "Web Developer")

    visit category_path(category)
    click_on 'Categories'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(category.name)
  end
end
