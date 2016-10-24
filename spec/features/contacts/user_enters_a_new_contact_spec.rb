require 'rails_helper'

describe "User enters a new contact" do
  scenario "a user can add a new contact to an existing company" do
    company = Company.create(name: "Google", city: "Mountain View")

    visit company_path(company)

    fill_in "contact_name", with: "Sergey"
    fill_in "contact_position", with: "Brin"
    fill_in "contact_email", with: "brin@google.com"
    click_button "Create"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("Google")
    expect(page).to have_content("Sergey")
    expect(page).to have_content("Brin")
    expect(page).to have_content("brin@google.com")
  end
end
