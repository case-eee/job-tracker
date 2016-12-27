require "rails_helper"

describe "only an admin can create a new category" do
  before do
    admin = create(:user, user_name: "testadmin", admin:1)
    page.set_rack_session(user_id: admin.id)
  end

  it "admin creates a new category" do
    create_new_category
    expect(Category.first.title).to eq("Shoe Shiner")
  end

  it "a successful creation redirects admin to the show page" do
    create_new_category
    expect(page).to have_current_path(category_path(Category.first.id))
    expect(page).to have_content("Shoe Shiner")
  end

  describe " the admin attempts to create a category that already exists" do

    before { create_new_category }
    
    it "should redirect the admin to the new page" do
      create_new_category

      expect(page).to have_current_path(new_category_path)
    end
  end

  describe "user visits the new category page" do
    before do
      user = create(:user, user_name: "testuser")
      page.set_rack_session(user_id: user.id)
      visit(new_category_path)
    end

    it "user should see an error message" do
      expect(page).to have_content("You are not authorized to view this page")
      expect(page).to have_button("Back to home")
    end
  end

  def create_new_category
    visit(new_category_path)
    fill_in("Title", with: "Shoe Shiner")
    click_button("Create")
  end
end
