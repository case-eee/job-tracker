require 'rails_helper'

describe "When user visits the category show page" do
  before do
    FactoryGirl.reload
    category = create(:category_jobs)
    visit(category_path(category))
  end

  it "the user should see all jobs associated with that category" do
    expect(page).to have_content("Title_1")
    expect(page).to have_content("Title_2")
    expect(page).to have_content("Title_3")
    expect(page).to have_content("Title_4")
    expect(page).to have_content("Title_5")
  end

  it "the page should also have links to the jobs show page" do
    expect(page).to have_link("Title_1")
    expect(page).to have_link("Title_2")
    expect(page).to have_link("Title_3")
    expect(page).to have_link("Title_4")
    expect(page).to have_link("Title_5")
  end

end
