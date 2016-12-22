require "rails_helper"

describe "comments #destroy" do
  before do
    logged_as_user
    @job = create_jobs_with_comments
  end

  scenario "the user wants to delete a commment" do
    visit(company_job_comments_path(@job.company, @job))
    click_on("Delete", match: :first)

    expect(@job.comments.count).to eq(4)
  end

end
