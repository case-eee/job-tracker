require "rails_helper"

describe "User deletes a category" do
  scenario "a user can delete a category" do
    create(:category, title: "Cobbler")
    visit(categories_path(Category.first))

    click_on("Delete")

    expect(page).to have_content("Cobbler was successfully deleted!")
    expect(Category.count).to eq(0)
  end
end
