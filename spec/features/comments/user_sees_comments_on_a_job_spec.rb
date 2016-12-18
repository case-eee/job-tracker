require 'rails_helper'

describe "User can add comments to a job" do
  scenario "click on comment button" do
    job = create(:job)
    job.category = create(:category)
    job.save

    visit company_job_path(job.company, job)
    
    fill_in "Comment", with: "testing"
    click_on "Submit"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")
  end
  scenario "and see the entered comment on the page" do
    job = create(:job)
    job.category = create(:category)
    job.save

    visit company_job_path(job.company, job)
    
    fill_in "Comment", with: "testing testing"
    click_on "Submit"

    expect(page).to have_content "testing testing"
  end
end