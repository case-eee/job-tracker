require 'rails_helper'

describe "User sees all jobs" do
  describe "when job categories assigned" do
    scenario "a user sees all the jobs for a specific company" do
      company = create(:company)
      category1, category2 = create_list(:category, 2)
      job1, job2 = create_list(:job, 2)
      job1.category = Category.new
      job1.category = category1
      job1.save
      job2.category = Category.new
      job2.category = category2
      job2.save
      company.jobs << [job1, job2]

      visit company_jobs_path(company)

      expect(page).to have_content(company.name)
      expect(page).to have_link(job1.title)
      expect(page).to have_link(job2.title)
      expect(page).to have_link(category1.title)
      expect(page).to have_link(category2.title)
    end
  end
  describe "when job category is not always assigned" do
    scenario "jobs without category assined will show notification" do
      company = create(:company)
      category1, category2 = create_list(:category, 2)
      job1, job2 = create_list(:job, 2)
      job1.category = Category.new
      job1.category = category1
      job1.save
      job2.category = Category.new
      job2.category = category2
      job2.save
      company.jobs << [job1, job2]

      visit company_jobs_path(company)

      expect(page).to have_content(company.name)
      expect(page).to have_link(job1.title)
      expect(page).to have_link(job2.title)
      expect(page).to have_link(category1.title)
      expect(page).to have_link(category2.title)
    end    
  end
end
