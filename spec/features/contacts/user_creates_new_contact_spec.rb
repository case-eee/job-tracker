require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = Company.create!(name: "ESPN")
    # contact = company.contacts.create(full_name: "Bob Jones", position: "QA Manager", email: "bob@espn.com", company: "ESPN")

    visit company_jobs_path(company)

    fill_in "contact[full_name]", with: "Bob Jones"
    fill_in "contact[position]", with: "QA Manager"
    fill_in "contact[email]", with: "bob@espn.com"

    click_button "Create Contact"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("Bob Jones")
    expect(page).to have_content("QA Manager")
    expect(page).to have_content("bob@espn.com")
    expect(company.contacts.count).to eq(1)
  end
end
