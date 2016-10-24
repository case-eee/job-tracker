require 'rails_helper'

describe "User edits an existing tag" do
  scenario "a user can edit a tag" do
    tag = create(:tag)
    visit edit_tag_path(tag)

    fill_in "tag[title]", with: "Finance"
    click_button "Update"

    expect(current_path).to eq("/tags/#{Tag.last.id}")
    expect(page).to have_content("Finance")
    expect(page).to_not have_content(tag.title)
  end

  scenario "a user edits with invalid data" do
    tag = create(:tag)
    visit edit_tag_path(tag)

    fill_in "tag[title]", with: ""
    click_button "Update"

    expect(page).to have_content("Title can't be blank")
  end
end
