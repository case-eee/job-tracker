require 'rails_helper'

describe "When user visits a company page and clicks 'Delete' for the first contact" do
  it "the contact is deleted" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    visit company_contacts_path(company)

    within(".contact_#{contact.id}") do
      click_on "Delete"
    end

    expect(current_path).to eql(company_path(company))
    expect(page).to_not have_content("Jane Doe")
    expect(company.contacts.count).to eql(0)
  end
end

describe "When user visits a contact page and clicks 'Delete'" do
  it "the contact is deleted" do
    company = Company.create(name: "ESPN")
    contact = company.contacts.create(first_name: "Jane",
                                          last_name: "Doe",
                                          position: "CEO",
                                          email: "jane@company.com")
    visit company_contact_path(company, contact)

    click_on "Delete"

    expect(current_path).to eql(company_path(company))
    expect(page).to_not have_content("Jane Doe")
    expect(company.contacts.count).to eql(0)
  end
end
