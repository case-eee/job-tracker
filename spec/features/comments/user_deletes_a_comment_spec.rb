require "rails_helper"

describe "comments #destroy" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
  scenario "the user wants to delete a commment" do
    job = create(:job)
    job.comments << create_list(:comment, 5)
    visit(company_job_comments_path(job.company, job))
    click_on("Delete", match: :first)

    expect(job.comments.count).to eq(4)
  end

end
