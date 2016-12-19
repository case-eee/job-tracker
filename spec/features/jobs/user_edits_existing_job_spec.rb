require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN", city: "LA")
    category= Category.create(title: "cats")
    job = company.jobs.create(title: "Job Title", description: "Job Description", level_of_interest: 25, category_id: category.id)
    visit edit_company_job_path(company, job)

    expect(page).to have_select('job[category_id]', selected: 'cats')

    fill_in "job[title]", with: "New Title"
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{job.id}")
    expect(page).to have_content("cats")
    expect(page).to have_content("New Title")
    expect(page).to_not have_content("Job Title")
  end
end
