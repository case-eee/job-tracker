require 'rails_helper'

describe "User can add a new contact" do
  scenario "a user can add a new contact from the company page" do
    company = create(:company)
    contact = create(:contact)
    company.contacts << contact

    visit company_path(company)

    fill_in "contact[name]", with: contact.name
    fill_in "contact[position]", with: contact.position
    fill_in "contact[email]", with: contact.email

    click_on("Submit")

    expect(page).to have_content(contact.name)
    expect(page).to have_content(company.name)
  end
end
