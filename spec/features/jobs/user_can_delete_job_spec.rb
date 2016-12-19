require 'rails_helper'

describe "User can delete a job" do
  scenario "from the job index page" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job

    visit company_jobs_path(company)

    click_on "Delete"

    expect(page).to have_content(company.name)
    expect(page).not_to have_link(job.title)
    expect(Job.count).to eq(0)
  end
  scenario "from the job detail page" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job

    visit company_jobs_path(company)

    click_on "#{job.title}"

    click_on "Delete"

    expect(page).to have_content(company.name)
    expect(page).not_to have_content(job.title)
    expect(Job.count).to eq(0)
  end
  scenario "and if the related comments will be also deleted from the database" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_comment = "Test comment"

    visit company_jobs_path(company)

    click_on "#{job.title}"

    fill_in "comment[content]", with: new_comment

    click_on "Save"

    expect(Comment.count).to eq(1)

    click_on "Delete"

    expect(page).to have_content(company.name)
    expect(page).not_to have_content(job.title)
    expect(Job.count).to eq(0)
  end
  
end
