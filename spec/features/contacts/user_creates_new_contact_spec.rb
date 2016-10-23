require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = create(:company)

    visit company_jobs_path(company)

    fill_in "contact[full_name]", with: "A Name"
    fill_in "contact[position]", with: "A Position"
    fill_in "contact[email]", with: "An Email"

    within('.new_contact') do
      click_button "Submit"
    end

    expect(page).to have_content "A Name"
    expect(page).to have_content "A Position"
    expect(page).to have_content "An Email"
    expect(current_path).to eq("/companies/#{company.id}/jobs")
  end

  scenario "user enters invalid data" do
    company = create(:company)

    visit company_jobs_path(company)

    fill_in "contact[full_name]", with: "A Name"
    fill_in "contact[position]", with: ""
    fill_in "contact[email]", with: "An Email"

    within('.new_contact') do
      click_button "Submit"
    end
    
    expect(page).to have_content "Information missing"
    end
end
