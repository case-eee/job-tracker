require 'rails_helper'

describe "User creates a comment" do
  scenario "with valid attributes" do 
    
    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job
    content = "What a horrendous job!"
    current_comment_count = job.comments.count
    other_content = job.comments.first.content

    visit company_job_path(company, job)

    fill_in "comment[content]", with: content
    click_on "Create Comment"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content "Comment created"
    expect(page).to have_content content
    expect(job.comments.count).to eq current_comment_count + 1
    expect((page.body.index(content) < page.body.index(other_content)))
  end

  scenario "with invalid attributes" do

    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job

    visit company_job_path(company, job)
    click_on "Create Comment"

    expect(page).to have_content "Content can't be blank"
  end
end