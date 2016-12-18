require 'rails_helper'

describe "User deletes existing tag" do
  scenario "a user can delete a tag" do
    tag = Tag.create!(title:"fancy")
    tag1 = Tag.create!(title:"boring")

    visit tag_path(tag1)

    expect(page).to have_content("boring")

    click_link "Delete"

    expect(page).to have_content("boring tag was successfully deleted!")
    expect(Tag.count).to eq(1)
  end
end
