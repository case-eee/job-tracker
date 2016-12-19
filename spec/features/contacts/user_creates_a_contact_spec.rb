require 'rails_helper'

RSpec.feature "User creates a contact" do

  scenario "by adding it to a company's page" do
    company = create(:company)
    visit company_path(company)
    fill_in "contact[full_name]", :with => "Fake Name"
    fill_in "contact[position]", :with => "Fake Job"
    fill_in "contact[email]", :with => "fake@notreal.com"
    click_on "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Fake Name")
  end

  scenario "that cannot save if invalid" do
    company = create(:company_with_contact_and_job)
    visit company_jobs_path(company)
    fill_in "contact[full_name]", :with => "Fake Name"
    fill_in "contact[position]", :with => "Fake Job"
    click_on "Create Contact"

    expect(page).to have_content("Email can't be blank")
  end
end