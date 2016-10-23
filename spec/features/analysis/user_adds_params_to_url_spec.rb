require 'rails_helper'

describe "User adds location param in URL" do
  scenario "a user sees companies sorted by location" do
    company_1, company_2 = create_list(:company, 2)

    visit companies_path(sort: "location")

    expect(company_2.city).to appear_before(company_1.city)
  end
end

describe "User visit dashboard page" do
  scenario "user sees count of jobs by interest level" do
    job_1, job_2 = create_list(:job, 2)

    visit '/dashboard'

    within(".key_#{job_1.level_of_interest}") do
      expect(page).to have_content(job_1.level_of_interest)
      expect(page).to have_content(1)
    end

    within(".key_#{job_2.level_of_interest}") do
      expect(page).to have_content(job_2.level_of_interest)
      expect(page).to have_content(1)
    end
  end

  scenario "user sees top 3 companies by average interest level" do
    company_1, company_2, company_3 = create_list(:company_with_jobs, 3)

    visit '/dashboard'

    expect(company_3.name).to appear_before(company_2.name)
    expect(company_3.name).to appear_before(company_1.name)
  end

  scenario "user sees count of jobs by location" do
    company = create(:company_with_jobs)

    visit '/dashboard'

    within('.jobsLocation') do
      expect(page).to have_content(company.city)
      expect(page).to have_content(2)
    end
  end

  scenario "user clicks location link to sorted page" do
    company = create(:company_with_jobs)

    visit '/dashboard'

    expect(page).to have_link(company.city, companies_path(:location => company.city))
  end

  scenario "user sees jobs sorted by interest" do
    company = create(:company_with_jobs)
    job_1 = company.jobs.first
    job_2 = company.jobs.last

    visit jobs_path(sorted: "interest")

    expect(job_1.title).to appear_before(job_2.title)
    expect(page).to have_link(job_1.title, company_job_path(company, job_1))
    expect(page).to have_link(job_2.title, company_job_path(company, job_2))
  end
end
