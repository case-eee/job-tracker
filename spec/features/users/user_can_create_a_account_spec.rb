require "rails_helper"

describe "user creates an account" do
  before do
  visit(new_user_path)
  end

  it "the user creates a new account " do
    fill_in("User Name", with: "Mr. Beans")
    fill_in("Password", with: "franklin")
    click_on("Create")

    expect(User.count).to eq(1)
    expect(User.first.user_name).to eq("Mr. Beans")
  end

  scenario "after creating an account the user should be redirected to their page" do
    fill_in("User Name", with: "Mr. Beans")
    fill_in("Password", with: "franklin")
    click_on("Create")

    user = User.find_by(user_name: "Mr. Beans")

    expect(page).to have_current_path(user_path(user))
    expect(page).to have_content("Welcome #{user.user_name}!")
    expect(page).to have_content("Welcome to Job Tracker Welcome Mr. Beans!")
  end
end
