require 'rails_helper'

RSpec.describe "User can view all jobs from every company" do
  it "without any sorting" do
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

    visit jobs_path

    expect(page).to have_link(job1.title)
    expect(page).to have_content(job1.city)
    expect(page).to have_link(job2.title)
    expect(page).to have_content(job2.city)
  end
  it "sorted by location(city)" do
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
    cities = Job.all.pluck(:city).sort

    visit "/jobs?sort=location"

    within ("tr:nth-of-type(2)") do
      expect(page).to have_content(cities.first)
    end
    within ("tr:last") do
      expect(page).to have_content(cities.last)
    end
  end
  it "sorted by level of interest" do
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
    level_of_interests = Job.all.pluck(:level_of_interest).sort.reverse

    visit "/jobs?sort=interest"

    within ("tr:nth-of-type(2)") do
      expect(page).to have_content(level_of_interests.first)
    end
    within ("tr:last") do
      expect(page).to have_content(level_of_interests.last)
    end
  end
end