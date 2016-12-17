require 'rails_helper'

RSpec.describe "User can add comment to a job" do
  scenario "when enters any text into comment box" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_comment = "Test comment"

    visit company_job_path(company, job)

    fill_in "comment[content]", with: new_comment

    click_on "Save"

    expect(job.comments.count).to eq(1)
    expect(page).to have_content(new_comment)
  end
end