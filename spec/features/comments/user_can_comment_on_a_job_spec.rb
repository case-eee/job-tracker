require 'rails_helper'

describe "User visits a specific job and can add a comment" do
  scenario "user inputs a comment" do
    job = Job.first
    comment = "Test comment"
    comment_2 = "Test 2"

    visit company_job_path(job.company, job)

    fill_in "comment[text]", with: comment
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(job.company, job))
    expect(page).to have_content("Comment saved!")
    expect(page).to have_content(comment)

    fill_in "comment[text]", with: comment_2
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(job.company, job))
    expect(page).to have_content("Comment saved!")
    expect(page.find("li:nth-child(1)")).to have_content(comment_2)
    expect(page.find("li:nth-child(2)")).to have_content(comment)
  end
end
