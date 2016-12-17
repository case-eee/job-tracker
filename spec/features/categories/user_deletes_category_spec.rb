require 'rails_helper'

describe "User deletes a category" do
  scenario "from database" do
    
    category = create(:category)
    title = category.title
    
    visit category_path(category)

    click_on "Delete"

    expect(current_path).to eq categories_path
    expect(Category.count).to eq 0
    expect(page).to have_content "#{title} successfully deleted"
  end

  scenario "and its jobs are deleted" do
    
    company = create(:company_with_jobs)
    category = create(:category)
    category.jobs << company.jobs

    visit category_path(category)

    expect(Job.count).to eq category.jobs.count 

    click_on "Delete"

    expect(Job.count).to eq 0
  end
end