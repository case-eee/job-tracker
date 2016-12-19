require 'rails_helper'

describe "Interest Analytics" do
  describe "When a user visits the interest analytics page" do
    scenario "user sees the jobs with the highest levels of interest" do
      company  = Company.create(name: "Best Buy")
      category = Category.create(name: "Technology")
      job_1    = Job.create(title: 'Cashier', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company.id)
      job_2    = Job.create(title: 'Manager', level_of_interest: 200, city: 'Denver', category_id: category.id, company_id: company.id)
      job_3    = Job.create(title: 'Owner', level_of_interest: 300, city: 'Denver', category_id: category.id, company_id: company.id)

      visit('/jobs?sort=interest')
      # save_and_open_page

      expect(page).to have_content("Level of Interest: 300")
      expect(page).to have_content("Owner")
      expect(page).to have_content("Level of Interest: 200")
      expect(page).to have_content("Manager")
      expect(page).to have_content("Level of Interest: 100")
      expect(page).to have_content("Cashier")
    end

    scenario "user clicks on a job" do
      company  = Company.create(name: "Best Buy")
      category = Category.create(name: "Technology")
      job      = Job.create(title: 'Cashier', level_of_interest: 100, city: 'Denver', category_id: category.id, company_id: company.id)

      visit('/jobs?sort=interest')
      click_on 'Cashier'
      # save_and_open_page

      expect(current_path).to eq(company_job_path(company, job))
      expect(page).to have_content('Cashier')
    end
  end
end
