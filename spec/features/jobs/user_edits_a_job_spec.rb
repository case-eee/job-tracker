require 'rails_helper'

RSpec.feature "User can edit a job" do
  before do
    @company = Company.create(name: "Enron")
    @company.jobs << Job.create(title: "Car Washer", description: "$175k/yr", city: "Denver", level_of_interest: "100")
    @job = Job.find_by(title: "Car Washer")
  end

  scenario "if all their entries are valid" do
    visit company_job_path(@company, @job)
    click_on "Edit"
    fill_in "Title", with: "Freelance Custodian"
    click_on "Update Job"

    expect(page).to have_content "Freelance Custodian"
  end
end