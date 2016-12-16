require "rails_helper"

describe "User creates a new category" do
  it "the user can create a new category" do
    visit("/categories/new")
    fill_in("Title", with: "Web Development")
    click_button("Create")
    expect(Category.count).to eq(1)
    expect(page).to have_current_path(category_path(Category.first.id))

    expect(page).to have_content("Web Development")
  end
end
