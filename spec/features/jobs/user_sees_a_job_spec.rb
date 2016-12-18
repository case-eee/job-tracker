require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    Category.create(id:3,title:"HR")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 3)

    visit company_job_path(company, job)
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")
  end

  scenario "a user creates a comment for the job" do
    company = Company.create!(name: "ESPN")
    Category.create(id:3,title:"HR")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 3)

    visit company_job_path(company, job)
    fill_in "comment[content]", with: "this is a comment"
    click_on "Create Comment"
    expect(page).to have_content("this is a comment")
    expect(Comment.count).to eq(1)
  end

  scenario "a user deletes a comment for the job" do
    company = Company.create!(name: "ESPN")
    Category.create(id:3,title:"HR")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: 3)
    comment = job.comments.create!(content:"check plz!")

    visit company_job_path(company, job)
    expect(page).to have_content("check plz!")

    within(".comment_#{comment.id}") do
      click_link "Delete"
    end
  end
end
