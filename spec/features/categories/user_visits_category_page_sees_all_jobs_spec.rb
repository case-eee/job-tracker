require 'rails_helper'

describe "When a user views a specific Category page they see all jobs" do
  scenario "user visits a category page" do
    category = Category.first

    visit category_path(category)

    expect(page).to have_content(category.title)
    expect(page).to have_content(Job.first.title)
    expect(page).to have_content(Job.all[1].title)
  end
end
