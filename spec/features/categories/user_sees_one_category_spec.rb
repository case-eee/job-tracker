require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    category = job.category

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(category.title)
    expect(page).to have_content(job.title)
  end

  scenario "a user can click job link" do
    company = create(:company_with_jobs)
    job = company.jobs.first
    category = job.category

    visit category_path(category)

    expect(page).to have_link(job.title, company_job_path(company, job))
  end
end
