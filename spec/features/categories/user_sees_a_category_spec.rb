require 'rails_helper'

describe "User visits a category page" do
  scenario "sees name and jobs" do
  
  category = create(:category_with_jobs)

  visit category_path(category)

  expect(page).to have_content category.title
  expect(page).to have_content category.job.first.name
  end
end