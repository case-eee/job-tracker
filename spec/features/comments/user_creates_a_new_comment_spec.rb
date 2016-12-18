require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comments" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Technology")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit(company_job_path(company, job))

    # click_button "Add a New Comment"
    fill_in "comment_author", with: "me"
    fill_in "comment_body", with: "hello"
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("me")
    expect(page).to have_content("hello")
  end
end
