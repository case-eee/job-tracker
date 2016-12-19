require 'rails_helper'

describe "dashboard" do
  describe "job analytics on dashboard" do
    scenario "user visits dashboard page" do
      visit('/dashboard')

      expect(page).to have_content("Job counts of top 10 Interests")
    end
    scenario "user sees top companies by level of interest" do
      company  = Company.create(name: "Best Buy")
      category = Category.create(name: "Technology")
      job_1    = Job.create(title: 'Cashier', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company.id)
      job_2    = Job.create(title: 'Manager', level_of_interest: 200, city: 'Denver', category_id: category.id, company_id: company.id)
      job_3    = Job.create(title: 'Owner', level_of_interest: 300, city: 'Denver', category_id: category.id, company_id: company.id)

      visit('/dashboard')
      # save_and_open_page

      expect(page).to have_content("1 job(s) with a level of interest of 300")
      expect(page).to have_content("1 job(s) with a level of interest of 200")
      expect(page).to have_content("1 job(s) with a level of interest of 100")
    end

    scenario "user sees companies average level of interest" do
      company  = Company.create(name: "Best Buy")
      company_2 = Company.create(name: "Chipotle")
      category = Category.create(name: "Technology")
      job_1    = Job.create(title: 'Cashier', level_of_interest: 500, city: 'Denver', category_id: category.id, company_id: company.id)
      job_2    = Job.create(title: 'Manager', level_of_interest: 300, city: 'Denver', category_id: category.id, company_id: company.id)
      job_3    = Job.create(title: 'Owner', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company_2.id)
      job_4    = Job.create(title: 'Owner', level_of_interest: 300, city: 'Denver', category_id: category.id, company_id: company_2.id)

      visit('/dashboard')
      # save_and_open_page

      expect(page).to have_content("Best Buy has an average level of interest of: 400.0")
      expect(page).to have_content("Chipotle has an average level of interest of: 200.0")
    end
  end
end
