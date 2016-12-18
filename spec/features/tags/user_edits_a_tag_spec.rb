require 'rails_helper'

describe "User edits a specific tag" do
  scenario "starting from tag show" do
    tag = Tag.create!(title:"fancy")

    visit tag_path(tag)

    expect(page).to have_content("fancy")
    click_on "Edit"

    fill_in "tag[title]", with: "normal"
    click_on "Update"

    expect(page).to have_content("normal")
    expect(page).not_to have_content("fancy")
  end
end
