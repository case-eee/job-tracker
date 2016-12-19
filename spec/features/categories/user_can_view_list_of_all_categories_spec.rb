require 'rails_helper'

RSpec.describe "User can view list of all categories" do
  scenario "seeing empty list when no categories are in the database" do
    category1, category2 = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content("List of All Categories")
    expect(page).to have_link(category1.title)
    expect(page).to have_link(category2.title)
  end
end