require "rails_helper"

describe "the user is not logged in" do
  scenario "the user visits the home page" do
    visit(root_path)
    expect(page).to_not have_content("Categories")
    expect(page).to_not have_content("Jobs")
    expect(page).to_not have_content("Companies")
    expect(page).to_not have_content("Cities")

    expect(page).to have_content("Welcome to Job Tracker ")
    expect(page).to have_button("Login")
  end

  scenario "the user attempts to visit the categories path" do
    visit(categories_path)

    expect(page).to have_content("You must be logged in to access this section!")
    expect(page).to have_button("Back to home")
  end
end
