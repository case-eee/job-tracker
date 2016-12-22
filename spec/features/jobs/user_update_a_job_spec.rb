require 'rails_helper'

describe "job #edit" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
  it "a user can update a job" do
    company = create(:company_jobs)
    job = company.jobs.first
    visit(edit_company_job_path(company,job))

    fill_in("job[title]", with: "Janitor")
    within "#job_category_id" do
      select("Category_title_1")
    end
    click_button("Update")
    expect(page).to have_current_path(company_job_path(company,job))
    expect(company.jobs.first.title).to eq("Janitor")
    expect(page).to have_content("Janitor")
  end
end
