require 'rails_helper'

RSpec.describe "User can add comment to a job" do
  scenario "when enters content text into comment box" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_comment = "Test comment"

    visit company_job_path(company, job)

    fill_in "comment[content]", with: new_comment

    click_on "Save"

    expect(job.comments.count).to eq(1)
    comment = Comment.first
    expect(page).to have_content(new_comment)
    expect(page).to have_content(comment.created_at)
  end
  scenario "except when comment box is empty" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job

    visit company_job_path(company, job)

    fill_in "comment[content]", with: ""

    click_on "Save"

    expect(job.comments.count).to eq(0)
    expect(page).to have_content("Content can't be blank")
  end
  scenario "when enters conment after empty content error message" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    new_comment = "Test comment"    

    visit company_job_path(company, job)

    fill_in "comment[content]", with: ""

    click_on "Save"

    fill_in "comment[content]", with: new_comment

    click_on "Save"

    expect(job.comments.count).to eq(1)
    comment = Comment.first
    expect(page).to have_content(new_comment)
    expect(page).to have_content(comment.created_at)
  end
  scenario "comments are shown in descending order (latest first)" do
    company = create(:company)
    category1 = create(:category)
    job = create(:job)
    job.category = Category.new
    job.category = category1
    job.save
    company.jobs << job
    oldest_comment = "First test comment"
    newest_comment = "Most recent test comment"

    visit company_job_path(company, job)

    fill_in "comment[content]", with: oldest_comment

    click_on "Save"

    fill_in "comment[content]", with: newest_comment

    click_on "Save"

    comment_dates = Comment.all.order("created_at DESC").pluck(:created_at) 

    expect(job.comments.count).to eq(2)
    within (".one-comment:first") do
      expect(page).to have_content(newest_comment)
      expect(page).to have_content(comment_dates.first)
    end
  end
end