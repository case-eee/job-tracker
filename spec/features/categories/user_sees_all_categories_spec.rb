require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "sporty spice job")
    category_two = Category.create!(title: "sits-in-a-basement-all-day-job")

    visit categories_path

    expect(page).to have_content("sporty spice job")
    expect(page).to have_content("sits-in-a-basement-all-day-job")
  end

end