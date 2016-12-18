require 'rails_helper'

describe "User can see comments" do
  scenario "a user can add comments from the job page" do
    company = create(:company)
    job = create(:job)
    company.jobs << job
    comment = create(:comment)
    job.comments << comment

    visit company_job_path(company, job)

    click_on("Submit")

    fill_in "comment[content]", with: "important content"

    expect(page).to have_content("important content")
  end
end
