require 'rails_helper'

RSpec.feature "User enters contacts" do
  scenario "a user enters a single contact" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact[name]", with: "Testing Testing"
    fill_in "contact[position]", with: "Test Position"
    fill_in "contact[email]", with: "testing@testing.com"
    click_button "Create"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Testing Testing")
    expect(page).to have_content("Test Position")
    expect(page).to have_content("testing@testing.com")
  end

  scenario "a company has multiple contacts" do
    company = create(:company)
    contact_1 = create(:contact, company: company)
    contact_2= create(:contact, company: company)

    visit company_path(company)

    expect(page).to have_content(contact_1.name)
    expect(page).to have_content(contact_2.name)
    expect(page).to have_content(contact_1.position)
    expect(page).to have_content(contact_2.position)
    expect(page).to have_content(contact_1.email)
    expect(page).to have_content(contact_2.email)


  end
end
