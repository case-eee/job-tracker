require 'rails_helper'

describe "User submits multiple comments" do
  scenario "the most recent shows on top" do
    company = Company.create(name: "ESPN", city: "NYC")
    job = company.jobs.create(title: "Developer", description: "amazing", level_of_interest: 60)
    comment1 = job.comments.create(content: "first comment")
    comment2 = job.comments.create(content: "second comment")

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("first comment")
    expect(page).to have_content("second comment")
  end
end
