require 'rails_helper'

describe "Location Analytics" do
  describe "When a user visits the location analytics page" do
    scenario "user sees cities with the available jobs in each city" do
      company  = Company.create(name: "Best Buy")
      category = Category.create(name: "Technology")
      job_1    = Job.create(title: 'Cashier', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company.id)
      job_2    = Job.create(title: 'Manager', level_of_interest: 200, city: 'Denver', category_id: category.id, company_id: company.id)
      job_3    = Job.create(title: 'Owner', level_of_interest: 300, city: 'Denver', category_id: category.id, company_id: company.id)

      visit('/jobs?sort=location')
      # save_and_open_page

      expect(page).to have_content("List of the jobs sorted by city")
      expect(page).to have_content('Denver')
      expect(page).to have_content("#{job_1.title}, #{job_2.title}, #{job_3.title}")
      expect(page).to have_content("(#{company.jobs.count}) jobs")
    end

    scenario "user clicks on a city" do
      company  = Company.create(name: "Best Buy")
      category = Category.create(name: "Technology")
      job_1    = Job.create(title: 'Cashier', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company.id)

      visit('/jobs?sort=location')
      click_on 'Denver'
      # save_and_open_page

      expect(current_path).to eq("/jobs")
      expect(page).to have_content("Jobs for the city of Denver:")
      expect(page).to have_content("Cashier")
    end
  end
end
