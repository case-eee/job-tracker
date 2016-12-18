require 'rails_helper'

describe "User sees all jobs" do
  scenario "user does not specify sort" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit jobs_path

    save_and_open_page

    within("a:nth-of-type(1)") do
      job_1.title
    end
    within("a:nth-of-type(2)") do
      job_2.title
    end
    within("a:nth-of-type(3)") do
      job_3.title
    end
  end

  scenario "user wishes to sort by location" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit "/jobs?sort=location"

    save_and_open_page


    within("a:nth-of-type(1)") do
      job_2.title
    end
    within("a:nth-of-type(2)") do
      job_1.title
    end
    within("a:nth-of-type(3)") do
      job_3.title
    end
  end

  scenario "user wishes to sort by interest level" do
    job_1 = create(:job, city: "Denver", level_of_interest: 45)
    job_2 = create(:job, city: "Austin", level_of_interest: 40)
    job_3 = create(:job, city: "New York", level_of_interest: 50)

    visit "/jobs?sort=interest"

    save_and_open_page

    within("a:nth-of-type(1)") do
      job_3.title
    end
    within("a:nth-of-type(2)") do
      job_1.title
    end
    within("a:nth-of-type(3)") do
      job_2.title
    end
  end
end
