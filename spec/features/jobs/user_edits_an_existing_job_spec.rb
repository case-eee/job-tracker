require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can see job's attributes" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit edit_company_job_path(company, job)
    expect(page).to have_content(company.name)
    expect(page).to have_field("job[title]", :with => job.title)
    expect(page).to have_field("job[city]", :with => job.city)
    expect(page).to have_field("job[level_of_interest]", :with => job.level_of_interest)
  end

  scenario "a user submits valid attributes" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit edit_company_job_path(company, job)

    click_on "Update Job"

    expect(current_path).to eq(company_job_path(company, job))
  end

  scenario "a user submits invalid name" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: nil
    click_on "Update Job"

    job = Job.find(job.id)

    expect(job.title).to eq(job.title)
    expect(page).to have_content("Edit")
    expect(current_path).to eq(company_job_path(company, job))
  end

  scenario "a user submits invalid level_of_interest" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit edit_company_job_path(company, job)

    fill_in "job[level_of_interest]", with: nil
    click_on "Update Job"

    job = Job.find(job.id)

    expect(job.level_of_interest).to eq(job.level_of_interest)
    expect(page).to have_content("Edit")
    expect(current_path).to eq(company_job_path(company, job))
  end

  scenario "a user submits invalid city" do
    company = create(:company)
    job = create(:job)

    company.jobs << job

    visit edit_company_job_path(company, job)

    fill_in "job[city]", with: nil
    click_on "Update Job"

    job = Job.find(job.id)

    expect(job.city).to eq(job.city)
    expect(page).to have_content("Edit")
    expect(current_path).to eq(company_job_path(company, job))
  end
end
