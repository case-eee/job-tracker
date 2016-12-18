require 'rails_helper'

RSpec.feature "User creates new comment" do
  scenario "they can add it to a job" do
    content = "Love this job!"
    job = create(:job)
    visit company_job_path(job.company, job)
    fill_in "comment[content]", :with => content
    click_on "Create Comment"

    expect(current_path).to eq(company_job_path(job.company, job))
    expect(page).to have_content(content)
  end

  scenario "they cannot save without content" do
    job = create(:job)
    visit company_job_path(job.company, job)
    click_on "Create Comment"

    expect(page).to have_content("Content can't be blank")
  end

end