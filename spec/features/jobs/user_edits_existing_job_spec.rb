require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    job = Job.first
    company = Company.all[0]
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "MS Word Technitian"
    fill_in "job[level_of_interest]", with: 1
    fill_in "job[city]", with: "Greeley"
    click_on "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("MS Word Technitian")
    expect(page).to have_content(1)
    expect(page).to have_content("Greeley")

    expect(page).to_not have_content("Developer")
    expect(page).to_not have_content(85)
    expect(page).to_not have_content("Denver")
  end

  scenario "an error message warns is the job title is left blank" do
    job = Job.first
    company = Company.all[1]
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: nil
    fill_in "job[level_of_interest]", with: 1
    fill_in "job[city]", with: "Greeley"
    click_on "Update"

    within("h2") do
      expect(page).to have_content("1 error prohibited this record from being saved:")
    end
    expect(page).to have_content("Title can't be blank")

  end
    scenario "an error message warns is the job level of interest is left blank" do
      job = Job.first
      company = Company.all[1]
      visit edit_company_job_path(company, job)

      fill_in "job[title]", with: "Party Animal"
      fill_in "job[level_of_interest]", with: nil
      fill_in "job[city]", with: "Greeley"
      click_on "Update"

      within("h2") do
        expect(page).to have_content("1 error prohibited this record from being saved:")
      end
      expect(page).to have_content("Level of interest can't be blank")
      # expect(current_path).to eq(edit_company_job_path(company, job))
    end

  scenario "an error message warns is the job cuty is left blank" do
    job = Job.first
    company = Company.all[1]
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Party Animal"
    fill_in "job[level_of_interest]", with: 101
    fill_in "job[city]", with: nil
    click_on "Update"

    within("h2") do
      expect(page).to have_content("1 error prohibited this record from being saved:")
    end
    expect(page).to have_content("City can't be blank")
  end

end
