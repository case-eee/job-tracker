require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = create(:category)
    company = create(:company)
    job = Job.new(title: "Title", level_of_interest: 100, city: "Denver")
    job.category_id = category.id
    job.company_id = company.id

    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: job.level_of_interest
    fill_in "job[city]", with: job.city
    select "#{job.category.title}", from: 'job[category_id]'

    click_button "Create"

    job = Job.find_by(title: job.title)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.level_of_interest)
    expect(page).to have_content(job.city)
  end
end
