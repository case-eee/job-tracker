require 'rails_helper'

describe "User visits company show page" do
  scenario "they are able to create a new contact" do
    company = create(:company)
    visit company_path(company)

    fill_in "contact[full_name]", :with => "David Knott"
    fill_in "contact[position]", :with => "Developer"
    fill_in "contact[email]", :with => "david@gmail.com"

    click_on "Create Contact"

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content company.contacts.first.full_name
    expect(page).to have_content company.contacts.first.email
  end
end