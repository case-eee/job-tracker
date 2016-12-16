require 'rails_helper'

RSpec.feature "User can edit a job by clicking edit" do
  scenario "and can view the changes after clicking submit" do
    @company = create(:company_with_jobs)
    
    @job =@company.jobs.first
    new_title = "New new title"

    visit company_job_path(@company, @job)
 
    click_on "Edit"
    fill_in "job[title]", with: "New new title"
    save_and_open_page
    click_button "Update Job"
 

    expect(current_path).to eq("/companies/#{@company.id}/jobs") 
    expect(page).to have_content "New new title"
    expect(page).to_not have_content @job.title
  end
end