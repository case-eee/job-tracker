require "rails_helper"

describe "comments #index" do
  before do
    FactoryGirl.reload
    @job = create(:job)
    @job.comments << create_list(:comment,5)
    visit(company_job_comments_path(@job.company, @job))
  end
  it "should display all comments related to job to the user" do
    @job.comments.each do |comment|
      expect(page.body).to have_content(comment.content)
    end
  end

  it "comments should be sorted newest to oldest" do
    ordered_comments = Comment.order(:created_at)
    ordered_comments.each do |comment|
      expect(page.body).to have_content(comment.content)
    end
    expect(ordered_comments.first.created_at).to be < (ordered_comments.second.created_at)
  end
end
