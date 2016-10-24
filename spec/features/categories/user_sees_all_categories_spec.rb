require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the catagories" do
    category1 = Category.create(title: "testing")
    category2 = Category.create(title: "analysis")

    visit categories_path

    expect(page).to have_content("testing")
    expect(page).to have_content("analysis")
  end
end
