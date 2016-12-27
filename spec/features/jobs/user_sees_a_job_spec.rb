require 'rails_helper'

describe "job #show" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
  scenario "a user sees a job for a specific company" do
    company = create(:company_jobs, name: "ESPN")
    job = company.jobs.find_by(title: "Title_1")
    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Title_1")
    expect(page).to have_content("City")
  end
end
