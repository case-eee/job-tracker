require 'rails_helper'

RSpec.feature "User creates new comment" do
  scenario "they can add it to a job" do
    content = "Love this job!"
    job = create(:job)
    visit company_job_path(job.company, job)
    fill_in "comment[content]", :with => content
    click_on "Create Comment"

    expect(page).to have_content(content)
  end

end