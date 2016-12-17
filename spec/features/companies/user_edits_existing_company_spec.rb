require 'rails_helper'

describe "User edits an existing company" do
  scenario "a user can edit a company" do
    company = create(:company)
    visit edit_company_path(company)
    new_company_name = "EA Sports"

    fill_in "company[name]", with: new_company_name
    click_on "Update"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content(new_company_name)
    expect(page).to_not have_content(company.name)
  end
  scenario "a user sees error when want to update Company with empty name" do
    company = create(:company)
    visit edit_company_path(company)

    fill_in "company[name]", with: ""
    click_on "Update"

    expect(page).to have_content("Name can't be blank")
    expect(Company.count).to eq(1)
  end
  scenario "a user can update details after error for the first time" do
    company = create(:company)
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
