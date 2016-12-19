require 'rails_helper'

describe "User sees all contacts for a company" do
  scenario "a user can see all contacts" do
    company = Company.create!(name: "ESPN")
    contact_1 = company.contacts.create!(full_name: "Bob Jones", position: "QA Manager", email: "bob@espn.com")
    contact_2 = company.contacts.create!(full_name: "Emily Smith", position: "CTO", email: "emily@espn.com")

    visit company_jobs_path(company)

    expect(page).to have_content("Bob Jones")
    expect(page).to have_content("Emily Smith")
    expect(company.contacts.count).to eq(2)
  end
end
