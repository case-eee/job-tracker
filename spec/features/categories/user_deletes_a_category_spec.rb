require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Cats")
    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Cats was successfully deleted!")
  end

  scenario "a user tries to delete a category with jobs" do
    category = Category.create(title: "Cats")
    category.jobs.create(title: "Developer", level_of_interest: 70)
    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("All jobs must be deleted")
    expect(page).to have_content("Cats")
  end
end
