require 'rails_helper'

describe "User creates a comment" do
  scenario "user sees the comment on the show page for job" do
    company  = Company.create(name: "Best Buy")
    category = Category.create(name: 'Technology')
    job      = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    click_on 'Add Comment'
    fill_in 'comment[author]', with: "Drew Palazzari"
    fill_in 'comment[content]', with: "Job Tracker is fun!"
    click_on 'Create Comment'

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Drew Palazzari")
  end

  scenario "user creates an invalid comment" do
    company  = Company.create(name: "Best Buy")
    category = Category.create(name: 'Technology')
    job      = company.jobs.create(title: "Developer", level_of_interest: 40, city: "Denver", category_id: category.id)

    visit company_job_path(company, job)

    click_on 'Add Comment'
    click_on 'Create Comment'

    expect(current_path).to eq(new_company_job_comment_path(company, job))
    expect(page).to have_content("A Comment must have an author and content.")
  end
end
