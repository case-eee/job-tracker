require 'rails_helper'

describe "User edits an existing contact" do
  scenario "a user can edit a contact" do
    company = Company.create!(name: "ESPN")
    contact = company.contacts.create!(name:"original", position:"gangsta", email:"og@og.com", notes:"tha realest")
    visit company_contact_path(company, contact)
    
    expect(page).not_to have_content("ns@ns.org")
    expect(page).to have_content("og@og.com")

    click_link "Edit"

    fill_in "contact[name]", with: "new"
    fill_in "contact[position]", with: "school"
    fill_in "contact[email]", with: "ns@ns.org"
    fill_in "contact[notes]", with: "fresh"
    click_button "Update"
    expect(current_path).to eq("/companies/#{Company.last.id}/contacts/#{contact.id}")
    expect(page).to have_content("ns@ns.org")
    expect(page).not_to have_content("og@og.com")
  end
end
