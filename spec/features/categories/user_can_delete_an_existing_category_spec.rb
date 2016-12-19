require 'rails_helper'

describe "When user visits '/categories' and clicks 'Delete' for the first category" do
  it "the category is deleted" do
    @category = Category.create(title: "Business")
    visit categories_path

    within(".category_#{@category.id}") do
      click_link "DELETE"
    end

    expect(page).to have_content("Business was successfully deleted!")
    expect(Category.count).to eql(0)
  end
end

describe "When user visits a category page and clicks 'Delete'" do
  it "the category is deleted" do
    @category = Category.create(title: "Business")
    visit categories_path
    click_on "BUSINESS"

    expect(page).to have_content("BUSINESS")
    click_on "Delete"
    expect(page).to have_content("Business was successfully deleted!")
    expect(Category.count).to eql(0)
  end
end
