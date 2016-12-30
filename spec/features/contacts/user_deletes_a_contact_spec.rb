require 'rails_helper'

describe "User deletes existing contact" do
  scenario "a user can delete a contact" do
    company = Company.create!(name:"dream job hq")
    contact = company.contacts.create!(name:"TJF", position:"CZO", email: "tjf@dreamjobhq.com", notes:"rock climbing, and stuff")
    
    visit company_path(company)
    expect(page).to have_link("TJF")
    click_on("TJF")

    expect(page).to have_content("TJF")
    expect(page).to have_content("CZO")
    expect(page).to have_content("tjf@dreamjobhq.com")
    expect(page).to have_content("rock climbing, and stuff")

    click_link "Delete"

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).not_to have_content("TJF")
  end
end
