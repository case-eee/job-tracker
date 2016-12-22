require 'rails_helper'

describe "User can see comments in order of most recent appearance" do
  scenario "a user can see comments" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    comment1 = job.comments.create!(content: "Wow, I'd love to get this job.")
    comment2 = job.comments.create!(content: "This doesn't pay well for its status, geez!")
    visit(company_job_path(company, job))

    expect(page).to have_content("Wow, I'd love to get this job.")
    expect(page).to have_content(comment1.created_at)
    expect(page).to have_content(comment2.created_at)
  end
end