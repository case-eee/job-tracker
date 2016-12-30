require 'rails_helper'

RSpec.feature "User creates an account" do
  scenario "they enter correct data to create a new account" do
    user_name = "user1"
    user_email = "email1"
    user_password = "password1"

    visit new_user_path
    fill_in "user[name]", with: user_name
    fill_in "user[email]", with: user_email
    fill_in "user[password]", with: user_password
    click_on "Create User"

    expect(page).to have_content("user1 successfully created")
    expect(User.all.count).to eq(1)
  end

  scenario "they can't create a duplicate email account" do
    User.create(name:"user1", email:"email1", password:"password1")
    expect(User.all.count).to eq(1)

    user_name = "user2"
    user_email = "email1"
    user_password = "password1"

    visit new_user_path
    fill_in "user[name]", with: user_name
    fill_in "user[email]", with: user_email
    fill_in "user[password]", with: user_password
    click_on "Create User"

    expect(page).to have_content("that email is already in use")
    expect(User.all.count).to eq(1)
  end
end