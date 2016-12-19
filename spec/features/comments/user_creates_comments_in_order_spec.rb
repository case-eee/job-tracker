require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create comments" do
    company = Company.create!(name: "ESPN")
    category = Category.create(name: "Technology")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit(company_job_path(company, job))

    fill_in "comment_author", with: "author_1"
    fill_in "comment_body", with: "comment_1"
    click_button "Create Comment"
    fill_in "comment_author", with: "author_2"
    fill_in "comment_body", with: "comment_2"
    click_button "Create Comment"

    expect("author_2").to appear_before("author_1")
    expect("comment_2").to appear_before("comment_1")
  end
end
