require 'rails_helper'

describe "User can see comments" do
  scenario "a user can see all comments from the job page" do
    company = create(:company)
    job = create(:job)
    company.jobs << job
    comment = create(:comment)
    job.comments << comment

    visit company_job_path(company, job)

    expect(page).to have_content(comment.content)
  end
end
