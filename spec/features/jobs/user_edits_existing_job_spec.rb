require 'rails_helper'

describe "User edits existing job" do
  scenario "a user can edit a job" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "sample")
    job1 = company.jobs.create(title: "Developer", level_of_interest: 20, city: "Denver", category_id: category.id)

    visit company_job_path(company, job1)
    click_link "Edit"
    fill_in "Title", with: "Software Developer"
    fill_in "Level of interest", with: 55
    click_on "Update Job"

    expect(page).to have_content("Software Developer")
    expect(page).to have_content(55)
  end
end
