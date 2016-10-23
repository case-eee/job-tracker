require 'rails_helper'

describe "User creates a new tag" do
  scenario "a user can create a new tag" do
    visit new_tag_path

    fill_in "tag[title]", with: "Sports"
    click_button "Create"

    expect(current_path).to eq("/tags/#{Tag.last.id}")
    expect(page).to have_content("Sports")
  end

  scenario "a user enter invalid data" do
    visit new_tag_path

    fill_in "tag[title]", with: ""
    click_button "Create"

    expect(page).to have_content("Title can't be blank")
  end
end
