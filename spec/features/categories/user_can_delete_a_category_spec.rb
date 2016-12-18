require 'rails_helper'

describe "User can delete a category" do
  scenario "a user can delete a category" do
    category = create(:category)

    visit category_path(category)

    click_on("Delete")

    expect(Category.count).to eq(0)
  end
end
