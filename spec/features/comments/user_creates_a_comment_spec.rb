require 'rails_helper'

describe "User creates a comment" do
  scenario "with valid attributes" do 
    
    company = create(:company_with_jobs)
    job = company.jobs.first
    create(:category).jobs << job
    first_content = "What a horrendous job!"
    second_content = "Actually quite lovely"
    current_comment_count = job.comments.count

    visit company_job_path(company, job)

    fill_in "comment[content]", with: first_content
    click_on "Create Comment"

    expect(current_path).to eq company_job_path(company, job)
    expect(page).to have_content "Comment created"
    expect(page).to have_content first_content

    fill_in "comment[content]", with: second_content
    click_on "Create Comment"

    expect(job.comments.count).to eq current_comment_count + 2
    expect(page.body.index(first_content) > page.body.index(second_content)).to eq true
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