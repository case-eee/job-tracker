require 'rails_helper'

describe "User visits a company page" do
  scenario "sees contacts" do
    
    company = create(:company_with_jobs_and_contacts)

    visit company_path(company)

    company.contacts.each do |contact|
      expect(page).to have_content contact.name
      expect(page).to have_content contact.position
      expect(page).to have_content contact.email
    end
  end
end