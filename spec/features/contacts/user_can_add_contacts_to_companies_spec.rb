require 'rails_helper'

describe "When user views a company there is a form to add a contact" do
  scenario "User adds a contact to a company" do
    company = Company.first
    contact_name = "Penelope Santorini"
    contact_position = "Hiring Manager"
    contact_email = "penelope@wooo.com"

    visit company_jobs_path(company)

    fill_in "contact[name]", with: contact_name
    fill_in "contact[position]", with: contact_position
    fill_in "contact[email]", with: contact_email
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Name: #{contact_name}")
    expect(page).to have_content("Position: #{contact_position}")
    expect(page).to have_content("Email: #{contact_email}")
  end
end
