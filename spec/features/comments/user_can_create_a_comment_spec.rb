require 'rails_helper'

describe "User creates a comment" do
  scenario "user sees the comment on the show page for job" do
    company  = Company.create(name: "Best Buy")
    category = Category.create(name: 'Technology')
    job      = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    fill_in 'comment[author]', with: "Drew Palazzari"
    fill_in 'comment[content]', with: "Job Tracker is fun!"
    click_on 'Create Comment'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Drew Palazzari")
    expect(page).to have_content("Job Tracker is fun!")
  end

  scenario "user creates an invalid comment" do
    company  = Company.create(name: "Best Buy")
    category = Category.create(name: 'Technology')
    job      = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)
    fill_in 'comment[author]', with: "Noman"
    click_on 'Create Comment'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to_not have_content("Noman")
  end
end
