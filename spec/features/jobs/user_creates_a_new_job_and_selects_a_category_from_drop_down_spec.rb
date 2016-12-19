require 'rails_helper'

describe "When creating a new job, User selects a category from a dropdown" do
  scenario "user selects category from dropdown when creating a job" do
    company = Company.first

    visit new_company_job_path(company)
    fill_in "job[title]", with: "Developer"
    fill_in "job[level_of_interest]", with: 90
    fill_in "job[city]", with: "Denver"
    find(:select).find("option[1]").select_option
    click_button "Create Job"

    job = Job.last


    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("90")
    expect(page).to have_content("Denver")
  end
end
