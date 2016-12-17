require 'rails_helper'

describe "User visits job page" do
  scenario "sees comments" do

    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job
    comment_one, comment_two = job.comments

    visit company_job_path(company, job)

    expect(page).to have_content comment_one.content
    expect(page).to have_content comment_one.created_at.inspect
    expect(page).to have_content comment_two.content
    expect(page).to have_content comment_two.created_at.inspect
  end
end