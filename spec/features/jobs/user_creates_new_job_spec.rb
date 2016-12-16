require 'rails_helper'

describe "User creates a new job" do
  scenario "with valid attributes" do
    company = create(:company)
    category = create(:category)

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    fill_in "job[category]", with: category.id

    click_button "Create"

    job = company.jobs.last

    expect(current_path).to eq company_job_path(company, job) 
    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.level_of_interest
    expect(page).to have_content job.city
    expect(page).to have_content job.category
  end

  scenario "with invalid attributes" do
    company = create(:company)
    visit new_company_job_path(company)

    click_button "Create"

    job = company.jobs.last

    expect(page).to have_content "Title can't be blank"
  end
end
