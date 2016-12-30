require 'rails_helper'

describe "User shows one contact" do
  scenario "a user sees the contacts details" do
    company = Company.create!(name:"dream job hq")
    contact = company.contacts.create!(name:"TJF", position:"CZO", email: "tjf@dreamjobhq.com", notes:"rock climbing, and stuff")
    
    visit company_contact_path(company, contact)

    expect(current_path).to eq("/companies/#{company.id}/contacts/#{contact.id}")
    expect(page).to have_content("TJF")
    expect(page).to have_content("CZO")
    expect(page).to have_content("tjf@dreamjobhq.com")
    expect(page).to have_content("rock climbing, and stuff")
  end
end
