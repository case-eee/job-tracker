require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)
    fill_in "comment[content]", with: "A Comment"

    click_button "Submit"

    expect(page).to have_content "A Comment"
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
  end

  scenario "user creates multiple comments" do
    company = create(:company_with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)
    first_comment, second_comment = ["A Comment", "A Second Comment"]
    fill_in "comment[content]", with: first_comment
    click_button "Submit"

    fill_in "comment[content]", with: second_comment
    click_button "Submit"

    expect(page).to have_content(first_comment)
    expect(page).to have_content(second_comment)
    end

  scenario "comments show in descending order of created time" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    first_comment, second_comment = ["A Comment", "A Second Comment"]

    visit company_job_path(company, job)
    fill_in "comment[content]", with: first_comment
    click_button "Submit"

    fill_in "comment[content]", with: second_comment
    click_button "Submit"

    expect(second_comment).to appear_before(first_comment)
  end

  scenario "user enters invalid data" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    
    visit company_job_path(company, job)
    fill_in "comment[content]", with: ""
    click_button "Submit"

    expect(page).to have_content("Content can't be blank")
  end
end
