require 'rails_helper'

describe "user updates an existing job" do
  it "a user can update a job" do
    company = create(:company)
    company.jobs << create(:job, title: "President")
    job = company.jobs.first
    visit(edit_company_job_path(company,job))

    expect(company.jobs.first.title).to eq("President")

    fill_in("job[title]", with: "Janitor")
    click_button("Update")
    expect(page).to have_current_path(company_job_path(company,job))
    expect(company.jobs.first.title).to eq("Janitor")
    expect(page).to have_content("Janitor")
  end
end
