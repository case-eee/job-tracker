require 'rails_helper'

describe "User sees the dashboard" do
  scenario "a user sees the analysis page" do
    company = Company.create(name: "ESPN", city: "LA")
    company2 = Company.create(name: "Elitch Gardens", city: "Denver")
    company3 = Company.create(name: "McDonald's", city: "Reno")

    company.jobs.create(title: "Developer", level_of_interest: 70)
    company.jobs.create(title: "QA Analyst", level_of_interest: 70)
    company.jobs.create(title: "Cat Analyst", level_of_interest: 100)
    company2.jobs.create(title: "Developer", level_of_interest: 55)
    company2.jobs.create(title: "Ride Operator", level_of_interest: 12)
    company3.jobs.create(title: "Burger Flipper", level_of_interest: 2)

    visit dashboard_index_path

    expect(page).to have_content("Jobs by Level of Interest")
    expect(page).to have_content("70")
    expect(page).to have_content("2")
    expect(page).to have_content("Top Three Companies")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("80")
    expect(page).to have_link("Denver", href: "/companies?location=Denver")
  end
end
