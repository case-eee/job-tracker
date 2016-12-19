require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category_with_jobs))
    visit edit_category_path(category)

    fill_in "Title", :with => "Brogramming"
    check("job-#{category.jobs.first.id}")
    check("job-#{category.jobs.first.id}")
    check("job-#{category.jobs.last.id}")
    click_button "Update"

    expect(current_path).to eq("/category/#{category.id}")
    expect(page).to have_content "Brogramming"
    expect(page).to have_content category.jobs.last.title 
    expect(page).to_not have_content category.jobs.first.title 
  end
end
