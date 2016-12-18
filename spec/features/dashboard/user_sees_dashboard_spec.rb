require 'rails_helper'

RSpec.feature "User sees dashboard" do
  it "user sees top 3 companies" do
    company_1, company_2, company_3, company_4 = create_list(:company, 4)
    create(:job, level_of_interest: 60, company: company_1)
    create(:job, level_of_interest: 40, company: company_2)
    create(:job, level_of_interest: 10, company: company_3)
    create(:job, level_of_interest: 50, company: company_4)

    visit dashboards_path

    save_and_open_page

    expect(page).to have_content(company_1.name)
    expect(page).to have_content(company_2.name)
    expect(page).to have_content(company_4.name)
    expect(page).to have_content(company_1.level_of_interest)
    expect(page).to have_content(company_2.level_of_interest)
    expect(page).to have_content(company_4.level_of_interest)
  end
end
