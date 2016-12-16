require 'rails_helper'

describe "User can delete a job" do
  scenario "from the job index page" do
    company = Company.create(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company)

    click_on "Delete"

    expect(page).to have_content("ESPN")
    expect(page).not_to have_content("Developer")
    expect(Job.count).to eq(0)
  end
  scenario "from the job detail page" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company)

    click_on "#{job.title}"

    click_on "Delete"

    expect(page).to have_content("ESPN")
    expect(page).not_to have_content("Developer")
    expect(Job.count).to eq(0)
  end
end
