require "rails_helper"

describe "Users can see all categories" do

  before do
    create_list(:category,5)
    visit("/categories")
  end

  scenario "the user visit categories#index page" do
    expect(Category.count).to eq(5)
    expect(page).to have_content("Category_title_1")
    expect(page).to have_content("Category_title_2")
    expect(page).to have_content("Category_title_3")
    expect(page).to have_content("Category_title_4")
    expect(page).to have_content("Category_title_5")
  end
end

describe "the user clicks on a button" do
  before do
    FactoryGirl.create_list(:category,5)
    visit("/categories")
  end

  context "buttons on page" do
    it "the page should have a edit button for each category" do
      expect(page).to have_button("Edit")
    end

    it "the page should have a delete button for each category" do
      expect(page).to have_button("Delete")
    end
  end

  scenario "should redirect them to the edit page" do
    within("li", match: :first) do
      click_on("Edit")
    end
    expect(page).to have_current_path(edit_category_path(Category.first.id))
  end

  scenario "should redirect them to the delete page" do
    within("li", match: :first) do
      click_on("Delete")
    end
    expect(page).to have_current_path(categories_path)
  end
end
