require 'rails_helper'

RSpec.feature "User visits dashboard" do

  scenario "they see top three companies by average level_of_interest" do
    company1 = create(:company_with_contact_and_job, jobs_count: 2)
    company2 = create(:company_with_contact_and_job, jobs_count: 3)
    company3 = create(:company_with_contact_and_job, jobs_count: 4)
    visit 'dashboard'
    
    within "div.top-three" do
      within "li.list-group-item:nth-of-type(1)" do
        expect(page).to have_content(company3.name)
        expect(page).to have_content(company3.jobs.average(:level_of_interest))
      end
      within "li.list-group-item:nth-of-type(2)" do
        expect(page).to have_content(company2.name)
        expect(page).to have_content(company2.jobs.average(:level_of_interest))
      end
      within "li.list-group-item:nth-of-type(3)" do
        expect(page).to have_content(company1.name)
        expect(page).to have_content(company1.jobs.average(:level_of_interest))
      end
    end
  end

  scenario "they see top three companies by average level_of_interest" do
    company1 = create(:company_with_contact_and_job, jobs_count: 2)
    company2 = create(:company_with_contact_and_job, jobs_count: 3)
    company3 = create(:company_with_contact_and_job, jobs_count: 4)
    visit 'dashboard'
    
    within "div.level_of_interest" do
      within "li.list-group-item:nth-of-type(1)" do
        expect(page).to have_content("1")
      end
    end
  end

  scenario "they see companies by location" do
    company1 = create(:company_with_contact_and_job, jobs_count: 2)
    company2 = create(:company_with_contact_and_job, jobs_count: 3)
    company3 = create(:company_with_contact_and_job, jobs_count: 4)
    visit 'dashboard'
    
    within "div.location" do
      within "li.list-group-item:nth-of-type(1)" do
        expect(page).to have_content("Denver, CO")
        expect(page).to have_content(9)
      end
    end
  end

  scenario "they can access the location page through dashboard" do
    company1 = create(:company_with_contact_and_job, jobs_count: 2)
    company2 = create(:company_with_contact_and_job, jobs_count: 3)
    company3 = create(:company_with_contact_and_job, jobs_count: 4)
    visit 'dashboard'
    click_on "Denver, CO"
    
    expect(page).to have_content(company1.jobs.first.title)
  end

end