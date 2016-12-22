require 'rails_helper'

describe "When user visits the category show page" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    @category = create(:category_jobs)
    visit(category_path(@category))
  end

  it "the user should see all jobs associated with that category" do
    @category.jobs.each do |job|
      expect(page).to have_content(job.title)
    end
    expect(@category.jobs.count).to eq(5)
  end

  it "the page should also have links to the jobs show page" do
    @category.jobs.each do |job|
      expect(page).to have_link(job.title)
    end
    expect(@category.jobs.count).to eq(5)
  end

end
