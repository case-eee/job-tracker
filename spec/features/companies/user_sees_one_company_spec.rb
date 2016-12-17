require 'rails_helper'

describe "User visits company" do
  scenario "sees company and jobs" do
    company = create(:company_with_jobs_and_contacts)

    visit company_path(company)

    expect(current_path).to eq company_jobs_path(company)
    expect(page).to have_content company.name
    expect(page).to have_content company.jobs.first.title
  end
end
