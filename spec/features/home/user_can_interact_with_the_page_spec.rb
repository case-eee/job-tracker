require "rails_helper"

describe "when the user views the home page" do
  scenario "the user should be able to click on create a new account" do
    visit('/')
    click_on("Create a new account")

    expect(page).to have_current_path("/users/new")
  end
end
