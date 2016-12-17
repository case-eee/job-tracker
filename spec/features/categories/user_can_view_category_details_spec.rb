require 'rails_helper'

describe "User can view category details (Show) page" do
  scenario "and sees all details listed" do
    category = create(:category)
    job1, job2 = create_list(:job, 2)
    category.jobs << [job1, job2]

    expect(Job.count).to eq(2)

    visit category_path(category)
    save_and_open_page

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content(category.title)
    expect(page).to have_link(job1.title, href: company_job_path(job1))
    expect(page).to have_link(job2.title, href: company_job_path(job2))
  end
end