require "rails_helper"

describe "user logins into an account" do
  before do
    User.create(user_name: "Mr. Beans", password: "franklin")
    visit(login_path)
  end

  scenario "after logging in  the user should be redirected to their page" do
    fill_in("User Name", with: "Mr. Beans")
    fill_in("Password", with: "franklin")
    within(".login_form") do
      click_on("Login")
    end

    user = User.find_by(user_name: "Mr. Beans")

    expect(page).to have_current_path(user_path(user))
    expect(page).to have_content("Welcome #{user.user_name}!")
  end
end
