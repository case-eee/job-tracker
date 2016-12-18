require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")

    visit company_job_path(company,job)

    fill_in "comment[content]", with: "Left voicemail with Bob"
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Left voicemail with Bob")
    expect(page).to have_content("Posted less than a minute ago")
    expect(Comment.count).to eq(1)
  end

  scenario "a user can create multiple comments for a single job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")

    visit company_job_path(company,job)

    fill_in "comment[content]", with: "Left voicemail with Bob"
    click_button "Submit"
    fill_in "comment[content]", with: "Also sent an e-mail to Bob."
    click_button "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Left voicemail with Bob")
    expect(page).to have_content("Also sent an e-mail to Bob.")
    expect(page).to have_content("Posted less than a minute ago")
    expect(Comment.count).to eq(2)
  end

end
