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
    expect(page.find('.content:nth-child(1)')).to have_content(ordered_comments.first.content)
    expect(page.find('.content:nth-child(2)')).to have_content(ordered_comments.second.content)
    expect(page.find('.content:nth-child(3)')).to have_content(ordered_comments.third.content)
    expect(page.find('.content:nth-child(4)')).to have_content(ordered_comments.fourth.content)
    expect(page.find('.content:nth-child(5)')).to have_content(ordered_comments.fifth.content)
  end
end
