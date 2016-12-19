require 'rails_helper'

describe "User creates a new job" do
  scenario "starting from company jobs page" do
    category = create(:category)
    company = Company.create!(name: "ESPN")

    visit company_jobs_path(company)

    click_on "New Job"

    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "#{category.title}"

    click_button "Create"


    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
