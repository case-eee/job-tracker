require 'rails_helper'

RSpec.feature "User can log in", type: :feature do
  scenario "registered user can login" do
    user = User.create!(username: "Molly", password: "password")

    visit login_path
    fill_in "Username", with: "Molly"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Molly!")
  end
end
