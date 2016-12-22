require "rails_helper"

describe "user logs out of their account" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit(user_path(user))
  end

  scenario "after logging out the user should be redirected to the root" do
    click_on("Logout")

    expect(page).to have_content("You have successfully logged out!")
    expect(page).to have_current_path(root_path)
  end
end
