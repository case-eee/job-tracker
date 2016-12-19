require 'rails_helper'

describe 'User visits company jobs page' do
  scenario 'they can see all contacts for that company' do
    company = create(:company_with_contacts)
    visit company_jobs_path(company)

    expect(page).to have_content company.contacts.first.full_name
    expect(page).to have_content company.contacts.last.email
  end
end