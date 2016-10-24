require 'rails_helper'

describe "User sees a specific category" do
  scenario "a user sees an existing category" do
    category1 = Category.create(title: "testing")
    category2 = Category.create(title: "analysis")

    visit category_path(category1)

    expect(page).to have_content("testing")
  end
end
