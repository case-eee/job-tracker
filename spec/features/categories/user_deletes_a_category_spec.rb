require "rails_helper"

describe "category #destroy" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
  scenario "a user can delete a category" do
    create(:category, title: "Cobbler")
    visit(categories_path(Category.first))
    within("tbody") do
      click_on("Delete", :match => :first)
    end

    expect(Category.count).to eq(0)
  end
end
