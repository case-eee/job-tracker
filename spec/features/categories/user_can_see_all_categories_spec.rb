require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category1 = create(:category)
    category2 = create(:category)

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
  end
end
