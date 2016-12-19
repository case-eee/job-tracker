require 'rails_helper'

describe "Categories can be deleted from the category index" do
  scenario "user deletes a category" do
    count = Category.all.count
    first = Category.first

    visit categories_path

    expect(page).to have_content("All Categories")

    first(:link, "Delete").click

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("The #{first.title} Category was successfully deleted")
    expect(page).to have_content("Two")
    expect(Category.all.count).to eq(count - 1)
  end
end
