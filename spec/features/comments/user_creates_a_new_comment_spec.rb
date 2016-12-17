require 'rails_helper'

describe "User visits new comment page" do
  scenario "they can create a new comment" do
    comment = create(:job_with_comments)
    visit new_company_job_comment_path

    fill_in "Content", :with => "This is a great job!"

    click_button "Create"

    expect(current_path). to eq company_job_path
    expect(page).to have_content("This is a great job!")
    expect(Comment.count).to eq(1)
  end
end

