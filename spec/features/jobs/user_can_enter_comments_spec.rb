require 'rails_helper'

RSpec.feature "User enters a comment" do
  scenario "a user enters a single comment" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Interview next week"
    click_button "Create"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Interview next week")
  end

  scenario "a user enters multiple comments" do
    skip
  end
end
