require 'rails_helper'

describe "When a user visits a company page" do
  it "they see the company and its jobs" do
    3.times {FactoryGirl.create(:category)}
    company = create(:company_with_jobs)
    byebug
    visit company_path(company)

    save_and_open_page

    expect(page).to have_content("Company A")
    expect(page).to have_content("Job 1")
    expect(page).to have_content("Job 2")
    expect(page).to have_content("Job 3")
  end
end
