require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user edits a job" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_jobs_path(company)
    
    within(".job_#{job.id}") do
      click_on 'Edit'
    end

    fill_in "job[title]", with: "Developer"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Developer")
    expect(page).not_to have_content(job.title)
  end

   scenario "a user edits with invalid data" do
     company = create(:company_with_jobs)
     job = company.jobs.first

     visit company_jobs_path(company)

     within(".job_#{job.id}") do
       click_on 'Edit'
     end

     fill_in "job[title]", with: ""
     click_button "Update"

     expect(page).to have_content("Title can't be blank")
   end
end
