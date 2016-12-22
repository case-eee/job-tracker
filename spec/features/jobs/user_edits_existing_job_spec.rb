require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company)
    job = create(:job, company: company)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Web Developer"
    fill_in "job[description]", with: "develops websites"
    fill_in "job[level_of_interest]", with: "10"
    fill_in "job[city]", with: "Not Denver"
    click_button "Update Job"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Web Developer")
    expect(page).to have_content("develops websites")
    expect(page).to have_content("10")
    expect(page).to have_content("Not Denver")
  end
end
