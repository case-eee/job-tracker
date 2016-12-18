require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: 2)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "a user adds a contact" do
    company = Company.create!(name: "ESPN")
    visit company_path(company)

    click_on "Create a contact"
    expect(current_path).to eq("/companies/#{company.id}/contacts/new")

    fill_in "contact[name]", with: "mary"
    fill_in "contact[position]", with: "accounting"
    fill_in "contact[email]", with: "mary@spotify.com"
    fill_in "contact[notes]", with: "met at conference, likes dipset"

    click_on "Create"

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_link("mary")

  end
end
