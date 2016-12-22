require "rails_helper"

describe "category #edit" do

  before do
    create_admin_and_visit_edit_path
  end

  scenario "a admin can edit a category" do
    expect(page).to have_content("Category_title_1")

    fill_in("Title", with: "Sheep Enthusiast")
    click_button("Update")

    expect(current_path).to eq(category_path(Category.first))
    expect(page).to have_content("Sheep Enthusiast")
  end

  describe "user tries to edit a category" do
    before do
      create_user_and_visit_edit_path
    end

    it "user should see an error message" do
      expect(page).to have_content("You are not authorized to view this page")
      expect(page).to have_button("Back to home")
    end
  end

  def create_admin_and_visit_edit_path
    admin = create(:user, user_name: "testadmin", admin:1)
    page.set_rack_session(user_id: admin.id)
    create_category_visit_edit_path
  end

  def create_user_and_visit_edit_path
    user = create(:user, user_name: "testuser")
    page.set_rack_session(user_id: user.id)
    create_category_visit_edit_path
  end

  def create_category_visit_edit_path
    category = create(:category)
    visit edit_category_path(category)
  end
end
