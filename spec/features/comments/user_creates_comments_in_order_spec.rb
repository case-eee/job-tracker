require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comments" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Technology")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit(company_job_path(company, job))

    click_button "Add a New Comment"
    fill_in "comment_author", with: "author_1"
    fill_in "comment_body", with: "1"
    click_button "Create Comment"
    click_button "Add a New Comment"
    fill_in "comment_author", with: "author_2"
    fill_in "comment_body", with: "2"

    expect("author_2").to appear_before("author_1")
    expect("2").to appear_before("1")
  end
end
