require 'rails_helper'

describe "User can leave comment on job" do
  before do
    @company = Company.create(name: "ESPN")
    @job = @company.jobs.create(title: "Janitor", level_of_interest: 99)
  end

  xscenario "a user can leave a comment a job's page" do

    visit company_job_path(@company, @job)

    fill_in "comment[content]", with: "This is a comment."
    click_on "Post"

    expect(current_path).to eq("/companies/#{@company.id}/jobs/#{@job.id}")
    expect(page).to have_content("This is a comment.")
  end

  xscenario "a user sees comments newest to oldest" do
    comment_1 = Comment.create(content: "first comment", job_id: @job.id)
    comment_2 = Comment.create(content: "second comment", job_id: @job.id)

    visit company_job_path(@company, @job)

    expect(page).to have_content comment_1.content
    expect(page).to have_content comment_2.content
  end
end