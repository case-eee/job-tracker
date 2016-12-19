require 'rails_helper'

describe "User visits the dashboard" do
  scenario "user sees a count of jobs at each interest level" do
    job1, job2, job3 = create_list(:job, 3)
    job1.update(level_of_interest: 3)
    expected = Job.count_by_interest

    visit(dashboard_path)

    within ".level_of_interest" do
      expect(page).to have_content(expected.keys.first)
      expect(page).to have_content(expected.keys.last)
      expect(page).to have_content(expected.values.first)
      expect(page).to have_content(expected.values.last)
    end
  end

  scenario "user sees top three companies by average interest" do
    company1, company2, company3, company4 = create_list(:company_with_jobs, 4)
    top_3 = Company.top_3_by_average_interest
    visit(dashboard_path)

    within ".top_3" do
      expect(page).to have_content(top_3.first.name)
      expect(page).to have_content(top_3[1].name)
      expect(page).to have_content(top_3.last.name)
    end
  end

   scenario "user sees locations and count of jobs for each city" do
    company1, company2, company3, company4 = create_list(:company_with_jobs, 4)
    jobs_by_location = Company.job_count_by_location
    job1 = company1.jobs.first
    job2 = company2.jobs.first
    job3 = company3.jobs.last
    job4 = company4.jobs.first
    visit(dashboard_path)

    within ".by_location" do
      expect(page).to have_content (job1.city)
      expect(page).to have_content (job2.city)
      expect(page).to have_content (job3.city)
      expect(page).to have_content (job4.city)
    end
  end

  scenario "user clicks on a city under counts of jobs by city" do 
    company1, company2, company3, company4 = create_list(:company_with_jobs, 4)
    jobs_by_location = Company.job_count_by_location
    job1 = company1.jobs.first
    job2 = company2.jobs.first
    job3 = company3.jobs.last
    job4 = company4.jobs.first
    visit(dashboard_path)

    click_link job3.city
    expect(page).to have_current_path("/jobs?location=#{job3.city}")
  end
end