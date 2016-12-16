require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category1 = create(:category)
    category2 = create(:category)

    visit categories_path

    expect(page).to have_link category1.title, href: category_path(category1)
    expect(page).to have_link category2.title, href: category_path(category2)

    
  end

end
