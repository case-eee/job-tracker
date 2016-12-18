require "rails_helper"

describe "comments#index" do
  it "should display all comments related to job to the user" do
    job = create(:job)
    job.comments << create_list(:comment,5)
    visit(company_job_comments_path(job.company, job))

    expect(page.body).to have_content("This is comment 1!")
    expect(page.body).to have_content("This is comment 2!")
    expect(page.body).to have_content("This is comment 3!")
    expect(page.body).to have_content("This is comment 4!")
    expect(page.body).to have_content("This is comment 5!")
  end
end
