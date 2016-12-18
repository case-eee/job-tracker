require 'rails_helper'

describe "User can view all contacts" do
  scenario "from the company page" do
    company = create(:company)
    contact = create(:contact)
    company.contacts << contact

    visit company_path(company)

    expect(page).to have_content(contact.name)
    expect(page).to have_content(company.name)
  end
end
