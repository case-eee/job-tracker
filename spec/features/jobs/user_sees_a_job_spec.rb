require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = create(:category)
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end


  scenario "they see all comments in reverse chronological order" do
    job = create(:job_with_comments)
    visit company_job_path(job.company, job)
    within("div.panel:nth-of-type(1)") do
      expect(page).to have_content(job.comments.last.content)
    end

    within("div.panel:nth-of-type(2)") do
      expect(page).to have_content(job.comments.first.content)
    end

  end
end
