require 'rails_helper'

describe "User can create a new category" do
  context "valid params" do
    scenario "category created" do
      title = "Web Development"

      visit new_category_path

      fill_in "Title", with: title

      click_on "Create Category"

      expect(page).to have_content "Web Development"
      expect(current_path).to eql("/categories/#{Category.first.id}")
    end
  end

  context "invalid params" do
    scenario "cannot create category" do
      Category.create(title: "Music")

      title = "Music"

      visit new_category_path

      fill_in "Title", with: title
      click_on "Create Category"

      expect(current_path).to eql(new_category_path)
    end
  end
end
