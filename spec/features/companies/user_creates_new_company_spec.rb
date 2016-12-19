require 'rails_helper'

describe "User creates a new company" do
  scenario "a user can create a new company" do
    visit new_company_path

    fill_in "company[name]", with: "ESPN"
    click_on "Save"

    company = Company.last
    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(company.name)
    expect(Company.count).to eq(1)
  end
  scenario "a user sees error message if tries to create company without name" do
    visit new_company_path

    click_on "Save"

    expect(page).to have_content("Name can't be blank")
    expect(Company.count).to eq(0)
  end
  scenario "a user can create company after error message" do
    new_company_name = "TestName"

    visit new_company_path

    click_on "Save"

    fill_in "company[name]", with: new_company_name
    click_on "Save"

    expect(page).to have_content(new_company_name)
    expect(Company.count).to eq(1)
  end
end
