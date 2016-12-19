require 'rails_helper'

RSpec.describe "User can view jobs sorted by city" do
  scenario "through /jobs?sort=location URL" do
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

    visit "/companies/#{company.id}/jobs?sort=location"

    within ("tr:nth-of-type(2)") do
      expect(page).to have_content(cities.first)
    end
    within ("tr:last") do
      expect(page).to have_content(cities.last)
    end
  end
end