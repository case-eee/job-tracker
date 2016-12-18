require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees all the category" do
    category = Category.create!(title: "sporty spice job")
    category_two = Category.create!(title: "sits-in-a-basement-all-day-job")

    visit category_path(category)

    expect(page).to have_content("sporty spice job")
    expect(page).not_to have_content("sits-in-a-basement-all-day-job")
  end

  scenario "a user sees all jobs with this category" do 
    category = Category.create!(title: "sporty spice job")
    category_two = Category.create!(title: "sits-in-a-basement-all-day-job")
    company = Company.create(name: "HEIQ Nuclear")
    category_two.jobs.create!(title: "Chief Engineer", description: "make stuff, make sure it works, make sure it doesn't kill people", city: "Bozeman", level_of_interest: 46, company_id: 1)
    visit category_path(category_two)

    expect(page).not_to have_content("sporty spice job")
    expect(page).to have_content("sits-in-a-basement-all-day-job")
    expect(page).to have_content("HEIQ Nuclear")
  end
end