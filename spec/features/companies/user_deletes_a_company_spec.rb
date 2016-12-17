require 'rails_helper'

describe "User deletes existing company" do
  scenario "with no jobs" do
    company = create(:company)
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content "#{company.name} was successfully deleted!"
  end

  scenario "its jobs are deleted" do
    company = create(:company_with_jobs_and_contacts)

    visit company_path(company)

    expect(Job.count).to eq company.jobs.count 

    click_on "Delete"

    expect(Job.count).to eq 0
  end
end
