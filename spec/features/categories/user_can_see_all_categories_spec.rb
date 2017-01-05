require 'rails_helper'

describe "User sees all categories" do
  scenario "a users sees all the categories" do
    first = Category.create(title: "A")
    second = Category.create(title: "B")

    visit categories_path

    expect(page).to have_content(first.title)
    expect(page).to have_content(second.title)
  end
end