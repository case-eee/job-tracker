require 'rails_helper'

RSpec.feature "User sees dashboard" do
  it "user sees top 3 companies" do
    company_1, company_2, company_3, company_4 = create_list(:company, 4)
    create(:job, level_of_interest: 60, company: company_1)
    create(:job, level_of_interest: 40, company: company_2)
    create(:job, level_of_interest: 10, company: company_3)
    create(:job, level_of_interest: 50, company: company_4)

    visit dashboards_path

    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)
    expect(page).to have_content(company_4.name)
    expect(page).to have_content(company_1.average_interest)
    expect(page).to have_content(company_2.average_interest)
    expect(page).to have_content(company_4.average_interest)
  end

  it "user sees count of jobs by interest level" do
    create_list(:job, 2, level_of_interest: 50)
    create_list(:job, 4, level_of_interest: 100)

    visit dashboards_path

    expect(page).to have_content(2)
    expect(page).to have_content(4)
    expect(page).to have_content(50)
    expect(page).to have_content(100)
  end

  it "user sees count of jobs by location" do
    create_list(:job, 2, city: "Austin")
    create_list(:job, 4, city: "New York")

    visit dashboards_path

    expect(page).to have_content(2)
    expect(page).to have_content(4)
    expect(page).to have_content("Austin")
    expect(page).to have_content("New York")
  end
end
