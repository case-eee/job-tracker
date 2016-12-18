require 'rails_helper'

RSpec.feature "User edits a job" do 
  scenario "it saves and redirects to job page" do
    category = create(:category)
    new_job_name = "Web Developer"
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit company_job_path(company, company.jobs.first)
    click_on "Edit"
    fill_in "job_title", :with => new_job_name
    fill_in "job_level_of_interest", :with => 99
    click_on "Update Job"

    expect(page).to have_content(new_job_name)
    expect(page).to have_content(99)
  end

  scenario "it does not save if missing title" do
    category = create(:category)
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    visit company_job_path(company, company.jobs.first)
    click_on "Edit"
    fill_in "job_title", :with => ""
    click_on "Update Job"

    expect(page).to have_content("Title can't be blank")
  end
end