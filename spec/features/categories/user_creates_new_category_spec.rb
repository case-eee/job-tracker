require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    job1, job2, job3 = create_list(:job, 3) 
    visit new_category_path

    fill_in "Title", :with => "Brogramming"
    check("job-#{job1.id}")
    check("job-#{job2.id}")
    check("job-#{job3.id}")

    click_button "Create"

    expect(current_path).to eq category_path(Category.last)
    expect(page).to have_content("Brogramming")
    expect(page).to have_content job2.title
    expect(Category.count).to eq(4)
  end
end