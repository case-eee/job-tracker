require "rails_helper"
include UserHelper
describe "category #new" do

  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)

    visit("/categories/new")
    fill_in("Title", with: "Web Development")
    click_button("Create")
  end

  scenario "the user can create a new category" do
    expect(Category.count).to eq(1)
  end

  scenario "a successful creation redirects user to the show page" do
    expect(page).to have_current_path(category_path(Category.first.id))
    expect(page).to have_content("Web Development")
  end

  context " the user attempts to create a category that already exists" do
    it "should redirect the user to the create page" do
      visit("/categories/new")
      fill_in("Title", with: "Web Development")
      click_button("Create")

      expect(page).to have_current_path(new_category_path)
    end
  end
end
