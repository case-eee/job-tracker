require 'rails_helper'

RSpec.describe "User can see dashboard" do
  it "shows all required details" do
    visit "/dashboard"

    expect(page).to have_content("Job Count by LOI")
    expect(page).to have_content("Top Companies by LOI")
    expect(page).to have_content("Jobs by Location")
  end
  it "shows column with LOI count list" do
    company1, company2 = create_list(:company, 2)
    category1, category2 = create_list(:category, 2)
    job1, job2, job3, job4 = create_list(:job, 4)
    job1.category = Category.new
    job1.category = category1
    job1.save
    job2.category = Category.new
    job2.category = category2
    job2.save
    company1.jobs << [job1, job2]
    company2.jobs << [job3, job4]
    lois = [job1.level_of_interest, job2.level_of_interest, job3.level_of_interest, job4.level_of_interest].uniq.sort.reverse
    lois_count = Job.where(level_of_interest: lois.first).count

    visit dashboard_path

    within (".dashboard-column:nth-of-type(1)") do
      within ("tr:nth-of-type(2)") do
        expect(page).to have_content(lois.first)
        expect(page).to have_content(lois_count)
      end
    end
  end
  it "shows column with Top3 Companies based on LOI list" do
    company1, company2 = create_list(:company, 2)
    category1, category2 = create_list(:category, 2)
    job1, job2, job3, job4 = create_list(:job, 4)
    job1.category = Category.new
    job1.category = category1
    job1.save
    job2.category = Category.new
    job2.category = category2
    job2.save
    company1.jobs << [job1, job2]
    company2.jobs << [job3, job4]
    company1_avg = company1.jobs.average(:level_of_interest)
    company2_avg = company2.jobs.average(:level_of_interest)
    loi_averages = [company1_avg, company2_avg].sort.reverse
    companies = {
      company1_avg => company1.name,
      company2_avg => company2.name
    }

    visit dashboard_path

    within (".dashboard-column:nth-of-type(2)") do
      within ("tr:nth-of-type(2)") do
        expect(page).to have_link(companies[loi_averages.first])
        expect(page).to have_content(loi_averages.first.to_f.round(2))
      end
    end
  end
  it "shows column with job count per city sorted alpabetically" do
    company1, company2 = create_list(:company, 2)
    category1, category2 = create_list(:category, 2)
    job1, job2, job3, job4 = create_list(:job, 4)
    job1.category = Category.new
    job1.category = category1
    job1.save
    job2.category = Category.new
    job2.category = category2
    job2.save
    company1.jobs << [job1, job2]
    company2.jobs << [job3, job4]
    job_cities = [job1.city, job2.city, job3.city, job4.city].sort
    city_counts = job_cities.inject({}) do |result, city|
      result[city] = Job.where(city: city).count
      result
    end

    visit dashboard_path

    within (".dashboard-column:nth-of-type(3)") do
      within ("tr:nth-of-type(2)") do
        expect(page).to have_link(job_cities.first)
        expect(page).to have_content(city_counts[job_cities.first])
      end
    end
  end
end