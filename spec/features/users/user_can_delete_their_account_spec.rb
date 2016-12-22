require "rails_helper"

describe "the user should be able to delete their account" do

  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit(user_path(user))
  end

  scenario "the user clicks on delete account" do
    click_on "Delete Account"

    expect(User.count).to eq(0)
  end
end
