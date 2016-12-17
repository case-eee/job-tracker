require 'rails_helper'

describe "User can view details of one company" do
  scenario "and all details are shown on the page" do
    company = create(:company)
    job = create(:job)
    company.jobs << job

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_link("Available Jobs")
    expect(page).to have_link("Edit Company Details")
    expect(page).to have_link("Delete Company")
  end
end
