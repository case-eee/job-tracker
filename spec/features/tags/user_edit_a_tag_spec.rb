require 'rails_helper'

describe "User edits a specific tag" do
  scenario "starting from tag show" do
    tag = Tag.new

    visit edit_company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")

    fill_in "job[title]", with: "Engineering"
    click_on "Update"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Engineering")
    expect(page).not_to have_content("Developer")
  end
end
