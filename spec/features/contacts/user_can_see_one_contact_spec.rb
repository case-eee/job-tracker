require 'rails_helper'

describe "When a user visits a contact page" do
  before do
    company = Company.create(name: "RockTenn")
    contact = company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    visit company_contact_path(company, contact)
  end

  it "they see the contact" do
    expect(page).to have_content("Jane")
    expect(page).to have_content("Doe")
    expect(page).to have_content("CEO")
    expect(page).to have_content("jane@company.com")
    expect(page).to have_content("RockTenn")
  end
end
