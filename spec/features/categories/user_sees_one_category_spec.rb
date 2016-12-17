require 'rails_helper'

RSpec.feature "User sees one category" do
  scenario "a user sees category" do
    category = create(:category)

    visit category_path(category)

    expect(page).to have_content(category.title)
  end

  scenario "a user can see jobs in category" do
    category = create(:category)
    company = create(:company)
    job_1 = create(:job)
    job_2 = create(:job, title: "Web Developer")
    company.jobs << [job_1, job_2]
    category.jobs << [job_1, job_2]

    visit category_path(category)

    expect(page).to have_link("Web Developer", href: company_job_path(company, job_2))
  end
end
