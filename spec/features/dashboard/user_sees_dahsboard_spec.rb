require 'rails_helper'

describe "User visits the dashboard" do
  scenario "user sees a count of jobs at each interest level" do
    job1, job2, job3 = create_list(:job, 3)
    job1.update(level_of_interest: 3)
    expected = Job.count_by_interest

    visit(dashboard_index_path)

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
    visit(dashboard_index_path)

    within ".top_3" do
      expect(page).to have_content(top_3.first.name)
      expect(page).to have_content(top_3[1].name)
      expect(page).to have_content(top_3.last.name)
    end
  end

  scenario "user sees list of locations and count of companies at each" do
    company1, company2, company3, company4 = create_list(:company_with_jobs, 4)

    visit(dashboard_index_path)

    within ".by_location" do
      expect(page).to have_content (company1.city)
      expect(page).to have_content (company2.city)
      expect(page).to have_content (company3.city)
      expect(page).to have_content (company4.city)
      
      click_link company1.city
      expect(page).to have_current_path("#{companies_path}/?location=#{company1.city}")
    end
  end    
end