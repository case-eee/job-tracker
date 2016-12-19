require 'rails_helper'

describe "User sees the dashboard" do
  scenario "a user sees jobs by level of interest" do
    company_1 = Company.create(name: "ESPN")
    company_2 = Company.create(name: "Denver Public Schools")
    company_3 = Company.create(name: "Bose")
    company_4 = Company.create(name: "Mc Donald's")

    company_1.jobs.create(title: "Developer", level_of_interest: 100, city: "Boston")
    company_2.jobs.create(title: "Announcer", level_of_interest: 2, city: "Boston")
    company_1.jobs.create(title: "Marketing", level_of_interest: 100, city: "Boston")
    company_3.jobs.create(title: "Developer", level_of_interest: 90, city: "Boston")
    company_2.jobs.create(title: "Developer", level_of_interest: 2, city: "Boston")
    company_1.jobs.create(title: "Announcer", level_of_interest: 70, city: "Boston")
    company_4.jobs.create(title: "Marketing", level_of_interest: 1, city: "Boston")
    expected = Job.count_by_interest

    visit dashboard_index_path

    within ".level_of_interest" do
      expect(page).to have_content(expected.keys.first)
      expect(page).to have_content(expected.keys.last)
      expect(page).to have_content(expected.values.first)
      expect(page).to have_content(expected.values.last)
    end
  end

  scenario "a user sees the top three companies" do
    company_1 = Company.create(name: "ESPN")
    company_2 = Company.create(name: "Denver Public Schools")
    company_3 = Company.create(name: "Bose")
    company_4 = Company.create(name: "Mc Donald's")

    company_1.jobs.create(title: "Developer", level_of_interest: 100, city: "Boston")
    company_2.jobs.create(title: "Announcer", level_of_interest: 2, city: "Boston")
    company_1.jobs.create(title: "Marketing", level_of_interest: 100, city: "Boston")
    company_3.jobs.create(title: "Developer", level_of_interest: 90, city: "Boston")
    company_2.jobs.create(title: "Developer", level_of_interest: 2, city: "Boston")
    company_1.jobs.create(title: "Announcer", level_of_interest: 70, city: "Boston")
    company_4.jobs.create(title: "Marketing", level_of_interest: 1, city: "Boston")

    top_3 = Company.top_3_by_average_interest

    visit(dashboard_index_path)

    within ".top_3" do
      expect(page).to have_content("Bose")
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Denver Public Schools")
    end
  end

  
end
