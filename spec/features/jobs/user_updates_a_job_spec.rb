require 'rails_helper'

describe "User updates a job" do
  scenario "a user can update a job" do
    company = create(:company_with_jobs)
    visit edit_company_job_path(company,company.jobs.first)

    fill_in "job[title]", with: "Marketer"
    fill_in "job[description]", with: "The Best"
    fill_in "job[level_of_interest]", with: 100
    fill_in "job[city]", with: "New York"

    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.first.id}")
    expect(page).to have_content company.name
    expect(page).to have_content("Marketer")
    expect(page).to have_content("100")
    expect(page).to have_content("New York")
  end
end
