require 'rails_helper'

describe "User visits jobs show page" do
  scenario "they can see all comments for that job" do
  company = create(:company_with_jobs_with_comments)
  job = company.jobs.first
    visit company_job_path(company, job)

    expect(page).to have_content job.comments.first.content
    expect(page).to have_content job.comments.last.content
    expect(Comment.count).to eq(100)
  end
end