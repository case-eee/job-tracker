require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "Web Developer")
    category_two = Category.create!(title: "Anouncer")

    visit categories_path

    expect(page).to have_content("Web Developer")
    expect(page).to have_text("Anouncer")
  end

end
