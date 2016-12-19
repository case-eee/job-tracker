require 'rails_helper'

describe "When a user visits '/categories' and clicks on 'Add Category'" do
  before do
    @category = Category.create(title: "Finance")
    visit categories_path
    click_on "Add Category"
  end

  it "they can create a new category" do
    fill_in "category[title]", with: "HR"
    click_button "Submit"

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content("HR")
    expect(Category.count).to eq(2)
  end

  it "they see an error message if they don't input a title" do
    click_button "Submit"

    expect(page).to have_content "Title can't be blank"
  end

  it "they see an error message if they input a title that already exists" do
    fill_in "category[title]", with: "Finance"
    click_button "Submit"

    expect(page).to have_content "Title has already been taken"
    expect(Category.count).to eq(1)
  end
end
