require "rails_helper"

describe "comments#new" do
  before do
    @job = create(:job)
    visit(new_company_job_comment_path(@job.company, @job))
    fill_in "comment[content]", with: "Maybe not!"
    click_on("Create Comment")
  end

  scenario "the user can create a new comment " do
    expect(@job.comments.count).to eq(1)
    expect(@job.comments.first.content).to eq("Maybe not!")
  end

  scenario "the user can leave multiple comments" do
    visit(new_company_job_comment_path(@job.company, @job))
    fill_in "comment[content]", with: "My second comment!"
    click_on("Create Comment")

    expect(@job.comments.count).to eq(2)
    expect(@job.comments.last.content).to eq("My second comment!")
  end
end
