require 'rails_helper'

describe "User sees all jobs" do

  before do
    company = create(:company_jobs)
    visit company_path(company)
  end

  scenario "a user sees all the jobs for a specific company" do
    expect(page).to have_content("Title_1")
    expect(page).to have_content("Title_2")
    expect(page).to have_content("Title_3")
  end
end
