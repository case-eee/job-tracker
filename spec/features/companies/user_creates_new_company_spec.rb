require 'rails_helper'

describe "User creates a new company" do
  scenario "with valid attributes" do
    visit companies_path
    click_on "New Company"

    fill_in "company[name]", with: "ESPN"
    click_button "Create"

    expect(current_path).to eq company_jobs_path(Company.last)
    expect(page).to have_content "ESPN" 
    expect(Company.count).to eq 1
  end

  scenario "without valid attributes" do
    visit new_company_path

    click_button "Create"

    expect(page).to have_content "Name can't be blank"
  
  end
end
