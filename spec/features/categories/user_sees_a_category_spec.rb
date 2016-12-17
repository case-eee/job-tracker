require 'rails_helper'

describe "User visits a category page" do
  scenario "sees name and jobs" do
  
  job = create(:company_with_jobs).jobs.first
  category = create(:category)
  category.jobs << job
  
  visit category_path(category)

  expect(page).to have_content category.title
  expect(page).to have_content category.jobs.first.title
  end
end