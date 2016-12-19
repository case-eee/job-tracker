require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    category = create(:category)
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "and all of their contacts" do
    company = create(:company_with_contact_and_job)
    visit company_jobs_path(company)

    expect(page).to have_content(company.contacts.first.full_name)
    expect(page).to have_content(company.contacts.last.full_name)
  end
end
