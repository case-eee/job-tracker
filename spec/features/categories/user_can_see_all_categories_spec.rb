require 'rails_helper'

describe "When a user visits '/categories'" do
  before do
    @category = Category.create(title: "Finance")
    @category_two = Category.create(title: "Business")
    visit categories_path
  end

  it "they see all the categories" do
    expect(page).to have_content("Finance".upcase)
    expect(page).to have_content("Business".upcase)
  end

  it "they are directed to the individual category page when they click on the category" do
    click_on "Finance".upcase

    expect(current_path).to eq(category_path(@category))
    expect(page).to have_content("Finance".upcase)
  end

end
