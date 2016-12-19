require 'rails_helper'

describe "When user visits a company page and clicks 'Delete' for the first job" do
  it "the job is deleted" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Business")
    job = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category.id}")
    visit company_jobs_path(company)

    within(".job_#{job.id}") do
      click_on "Delete"
    end

    expect(current_path).to eql(company_path(company))
    expect(page).to_not have_content("CEO")
    expect(company.jobs.count).to eql(0)
  end
end

describe "When user visits a job page and clicks 'Delete'" do
  it "the job is deleted" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Business")
    job = company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category.id}")
    visit company_job_path(company, job)

    click_on "Delete"

    expect(current_path).to eql(company_path(company))
    expect(page).to_not have_content("CEO")
    expect(company.jobs.count).to eql(0)
  end
end
