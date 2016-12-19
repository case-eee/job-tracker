require "rails_helper"

describe "category #edit" do

  before {FactoryGirl.reload}

  scenario "a user can edit a category" do
    category = create(:category)
    visit edit_category_path(category)

    expect(category.title).to eq("Category_title_1")

    fill_in("Title", with: "Sheep Enthusiast")
    click_button("Update")

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Sheep Enthusiast")
  end
end
