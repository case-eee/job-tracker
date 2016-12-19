require 'rails_helper'

describe "User sees all jobs" do
  scenario "user does not specify sort" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit jobs_path

    # within("a:nth-child(1)") do
    #   job_1.title
    # end
    # within("a:nth-child(2)") do
    #   job_2.title
    # end
    # within("a:nth-child(3)") do
    #   job_3.title
    # end
  end

  scenario "user wishes to sort by location" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit "/jobs?sort=location"

    # within("a:nth-child(1)") do
    #   job_2.title
    # end
    # within("a:nth-child(2)") do
    #   job_1.title
    # end
    # within("a:nth-child(3)") do
    #   job_3.title
    # end
  end

  scenario "user wishes to sort by interest level" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit "/jobs?sort=interest"

    # within("a:nth-child(1)") do
    #   job_3.title
    # end
    # within("a:nth-child(2)") do
    #   job_1.title
    # end
    # within("a:nth-child(3)") do
    #   job_2.title
    # end
  end

  scenario "user wishes to filter by location" do
    create_list(:job, 3, city: "Austin")
    create_list(:job, 4, city: "Denver")
    create_list(:job, 5, city: "New York")

    visit "/jobs?location=Denver"

    expect(page).not_to have_content("Austin")
    expect(page).not_to have_content("New York")
    expect(page).to have_content("Denver")
  end
end
