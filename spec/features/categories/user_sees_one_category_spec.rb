require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = create(:category_with_jobs)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content category.title
    expect(page).to have_content category.jobs.last.title
  end
end
