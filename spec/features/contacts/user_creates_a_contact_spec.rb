require 'rails_helper'

describe "User creates a contact" do
  scenario "a user can create a new contact" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact[full_name]", with: "John De Lancie"
    fill_in "contact[position]", with: "Q"
    fill_in "contact[email]", with: "allknowing@gmail.com"
    click_button "Create Contact"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("John De Lancie")
    expect(page).to have_content("allknowing@gmail.com")
    expect(page).to have_content("Q")
  end
end