require 'rails_helper'

RSpec.feature "When a user creates a new account", type: :feature do
  scenario "User creates a new account" do

    visit new_user_path
    fill_in "Username", with: "Molly"
    fill_in "Password", with: "password"
    click_button  "Create Account"

    assert page.has_content?("Welcome, Molly!")
  end
end
