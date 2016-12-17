require 'rails_helper'

describe "User can view category details (Show) page" do
  scenario "and sees all details listed" do
    company1, company2 = create_list(:company, 2)
    category = create(:category)
    job1, job2 = create_list(:job, 2)
    job1.company = company1
    job2.company = company2
    category.jobs << [job1, job2]

    expect(Job.count).to eq(2)

    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(category.title)
    expect(page).to have_link(job1.title, href: company_job_path(company1, job1))
    expect(page).to have_link(job2.title, href: company_job_path(company2, job2))
  end
end