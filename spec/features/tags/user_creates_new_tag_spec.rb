require 'rails_helper'

describe "User creates a new tag" do
  scenario "a user can create a new tag" do
    visit new_tag_path

    expect(current_path).to eq("/tags/new")
    
    fill_in "tag[title]", with: "hot fyah"
    click_on "Create Tag"
    expect(page).to have_content("hot fyah")
    expect(Tag.count).to eq(1)
  end
end