require 'rails_helper'

describe "User can create a new job" do
  scenario "when completes all fields" do
    company = Company.create(name: "ESPN")
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit new_company_job_path(company)

    fill_in "job[title]", with: new_job_title
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: new_job_level_of_interest
    fill_in "job[city]", with: new_job_city

    click_button "Save"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(new_job_title)
    expect(page).to have_content(new_job_description)
    expect(page).to have_field("job_city", with: "#{new_job_city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{new_job_level_of_interest}", disabled: true)
  end
  scenario "but not when there is error message because not all fields are completed" do
    company = Company.create(name: "ESPN")

    visit new_company_job_path(company)

    click_on "Save"

    expect(Job.count).to eq(0)
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Level of interest can't be blank")
    expect(page).to have_content("City can't be blank")
  end
  scenario "when after error message completes all fields" do
    company = Company.create(name: "ESPN")
    new_job_title = "Developer"
    new_job_description = "So fun!"
    new_job_level_of_interest = "80"
    new_job_city = "Denver, CO"

    visit new_company_job_path(company)

    click_on "Save"

    fill_in "job[title]", with: new_job_title
    fill_in "job[description]", with: new_job_description
    fill_in "job[level_of_interest]", with: new_job_level_of_interest
    fill_in "job[city]", with: new_job_city

    click_button "Save"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(Job.count).to eq(1)
    expect(page).to have_content(company.name)
    expect(page).to have_content(new_job_title)
    expect(page).to have_content(new_job_description)
    expect(page).to have_field("job_city", with: "#{new_job_city}", disabled: true)
    expect(page).to have_field("job_level_of_interest", with: "#{new_job_level_of_interest}", disabled: true)
  end
end
