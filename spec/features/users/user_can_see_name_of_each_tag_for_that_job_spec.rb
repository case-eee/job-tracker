require 'rails_helper'

describe "User visits a job page" do
  scenario "a user can see all tags associated with the job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = job.tags.create(title: "Aerospace")
    tag2 = job.tags.create(title: "Mechanical Engineering")
    tag3 = Tag.create(title: "Dog Sitting")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Aerospace")
    expect(page).to have_content("Mechanical Engineering")
    expect(page).to_not have_content("Dog Sitting")
  end
end
