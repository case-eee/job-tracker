require 'rails_helper'

describe "User can create a new comment" do
  scenario "a user can create comments" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit(company_job_path(company, job))

    fill_in "comment[content]", with: "Wow, I'd love to get this job.'"
    click_button "Create Comment"
    fill_in "comment[content]", with: "This doesn't pay well for its status, geez!'"
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Wow, I'd love to get this job.")
    expect(page).to have_content("This doesn't pay well for its status, geez!'")
  end
end