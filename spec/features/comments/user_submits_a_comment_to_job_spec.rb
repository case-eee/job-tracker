require 'rails_helper'

describe "User submits a comment" do
  scenario "a user can post a comment to an existing job" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer", description: "amazing", level_of_interest: 60)


    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Meeting Ross on Monday"
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Meeting Ross on Monday")
  end
end
