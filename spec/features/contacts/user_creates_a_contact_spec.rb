require 'rails_helper'

describe "User can create a contact" do
  scenario "a user can create a contact" do
    company = Company.create(name: "Chipotle")

    visit company_path(company)

    fill_in "contact[full_name]", with: "Ethan Bennett"
    fill_in "contact[position]", with: "Chief Burrito Roller"
    fill_in "contact[email]", with: "ebennett@chipotle.biz"
    click_on "Create Contact"

    expect(page).to have_content("Ethan Bennett")
    expect(page).to have_content("Chief Burrito Roller")
    expect(page).to have_content("ebennett@chipotle.biz")
  end
end