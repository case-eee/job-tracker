require 'rails_helper'

describe "User visits a job page" do
  scenario "a user count of jobs for each listed tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Basket Weaver", level_of_interest: 70, city: "Denver")
    job3 = company.jobs.create!(title: "Cook", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create(title: "Aerospace")
    tag2 = Tag.create(title: "Mechanical Engineering")
    tag3 = Tag.create(title: "Space Pilot")
    tag4 = Tag.create(title: "Dog Sitting")
    tag5 = Tag.create(title: "Bus Driver")

    job1.job_tags.create!(tag_id: tag1.id)
    job2.job_tags.create!(tag_id: tag1.id)
    job3.job_tags.create!(tag_id: tag2.id)
    job1.job_tags.create!(tag_id: tag2.id)
    job3.job_tags.create!(tag_id: tag3.id)

    visit company_job_path(company, job1)
    save_and_open_page

    expect(page).to have_content("Aerospace - 2")
    expect(page).to have_content("Mechanical Engineering - 2")
    expect(page).to_not have_content("Dog Sitting")
  end
end
