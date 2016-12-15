require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    company = Company.create!(name: "ESPN")
    visit edit_company_path(company)

    fill_in "company[name]", with: "EA Sports"
    click_on "Update"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end
  scenario "a user sees error when want to update Company with empty name" do
    company = Company.create!(name: "ESPN")
    visit edit_company_path(company)

    fill_in "company[name]", with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
    expect(Company.count).to eq(1)
  end
  scenario "a user can update details after error for the first time" do
    company = Company.create!(name: "ESPN")
    updated_company_name = "Updated Name"
    visit edit_company_path(company)

    fill_in "company[name]", with: ""
    click_on "Update"

    fill_in "company[name]", with: updated_company_name
    click_on "Update"
    
    expect(page).to have_content(updated_company_name)
    expect(Company.count).to eq(1)
  end
end
