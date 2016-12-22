require "rails_helper"

describe "when the user views the home page" do
  it "the user should be able to click on login" do
    visit('/')

    click_on("Login")

    expect(page).to have_current_path("/login")
    expect(page).to have_button("Create a new account")
  end
end
