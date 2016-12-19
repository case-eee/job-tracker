require 'rails_helper'

describe "When a user visits '/categories' and clicks on 'Edit' for the first category" do
  it "they can edit the category" do
    category = Category.create(title: "Business")
    visit categories_path
    within(".category_#{category.id}") do
      click_link "EDIT"
    end

    fill_in "category[title]", with: "Finance"
    click_button "Submit"

    expect(page).to have_content("Finance updated!")
    expect(Category.count).to eql(1)
    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content("Finance")
    expect(page).to_not have_content("Business")
  end
end

describe "When a user visits a category page and clicks on 'Edit'" do
  it "they can edit the category" do
    category = Category.create(title: "Business")
    visit category_path(category)
    click_link "Edit"

    fill_in "category[title]", with: "Finance"
    click_button "Submit"

    expect(page).to have_content("Finance updated!")
    expect(Category.count).to eql(1)
    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content("Finance")
    expect(page).to_not have_content("Business")
  end
end
