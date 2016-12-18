require 'rails_helper'

describe "User can add comments to a job" do
  scenario "click on comment button" do
    job = create(:job)
    job.category = create(:category)
    job.save

    visit company_job_path(job.company, job)
    click_link "Comment"


    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}/comments/1")
  end

end