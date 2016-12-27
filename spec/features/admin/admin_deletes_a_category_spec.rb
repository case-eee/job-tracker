require "rails_helper"

describe "category #destroy" do
  before do
    admin = create(:user, user_name: "testadmin", admin:1)
    page.set_rack_session(user_id: admin.id)
  end

  scenario "a admin can delete a category" do
    create(:category, title: "Cobbler")
    visit(categories_path(Category.first))
    within("tbody") do
      click_on("Delete", :match => :first)
    end

    expect(Category.count).to eq(0)
  end

  describe "user tries to delete a category" do
    before do
      user = create(:user, user_name: "testuser")
      page.set_rack_session(user_id: user.id)
      create(:category, title: "Cobbler")
      visit(categories_path(Category.first))
    end

    it "user should see an error message" do
      within("tbody") do
        click_on("Delete", :match => :first)
      end
      expect(page).to have_content("You are not authorized to view this page")
      expect(page).to have_button("Back to home")
    end
  end

end
