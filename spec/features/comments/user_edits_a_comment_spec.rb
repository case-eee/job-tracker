require "rails_helper"

describe "comments#edit" do
  before do
    comment = create_list(:comment, 5)
    job = Comment.first.job
    company = Comment.first.job.company
    visit(company_job_comments_path(company,job))
    click_on("Edit")
    fill_in("comment[content]", with: "This is the edited content!")
  end

  scenario "the user updates a comment" do
    expect(Comment.first.id).to eq(1)
    expect(Comment.first.content).to eq("This is comment 1!")

    click_on("Update")

    expect(Comment.first.id).to eq(1)
    expect(Comment.first.content).to eq("This is the edited content!")
  end

  it "the page should display the edited content" do
    click_on("Update")

    expect(page.body).to have_content("This is the edited content!")
  end
end
