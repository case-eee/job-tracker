require "rails_helper"

describe "only an admin can create a new city" do
  user = create(:user)
  page.set_rack_session(user_id: user.id)

end
