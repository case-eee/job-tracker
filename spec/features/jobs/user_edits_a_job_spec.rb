require 'rails_helper'

RSpec.feature "User can edit a job" do
  before do
    @company = Company.create(name: "Enron")
    @company.jobs << Job.create(title: "Car Washer", description: "$175k/yr", city: "Denver", level_of_interest: "100")
  end

  scenario "if all their entries are valid" do
    job = Job.find_by(title: "Car Washer")
    path = job.id
    # byebug
    visit edit_company_job_path(path)
    click_on "Edit"
    fill_in "title", with: "Freelance Custodian"
    click_on "Update Artist"

    expect(page).to have_content "Freelance Custodian"
  end
end