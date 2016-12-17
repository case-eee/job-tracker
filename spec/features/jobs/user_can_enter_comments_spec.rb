require 'rails_helper'

RSpec.feature "User enters a comment" do
  scenario "a user enters a single comment" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Interview next week"
    click_button "Create"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Interview next week")
  end

  scenario "a user enters multiple comments" do
    company = create(:company)
    job = create(:job, company: company)
    comment_1 = create(:comment, job: job)
    comment_2 = create(:comment, job: job)

    visit company_job_path(company, job)

    expect(page).to have_content(comment_1.content)
    expect(page).to have_content(comment_2.content)
  end
end
