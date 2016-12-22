require "rails_helper"

describe "comments #edit" do
  before do
    logged_as_user
    visit_edit_comment_path
    fill_in("comment[content]", with: "This is the edited content!")
  end

  scenario "the user updates a comment" do
    expect(Comment.first.content).to eq("This is comment 1!")
    click_on("Update")
    expect(Comment.first.content).to eq("This is the edited content!")
  end

  it "the page should display the edited content" do
    click_on("Update")

    expect(page.body).to have_content("This is the edited content!")
  end
end
