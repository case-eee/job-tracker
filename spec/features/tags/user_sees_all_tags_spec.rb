require 'rails_helper'

describe "User sees all tags" do
  scenario "a user sees all the tags" do
    tag_one, tag_two = create_list(:tag, 2)

    visit tags_path

    expect(page).to have_content(tag_one.title)
    expect(page).to have_content(tag_two.title)
  end

  scenario "a user can click tag link" do
    tag_one, tag_two = create_list(:tag, 2)

    visit tags_path

    expect(page).to have_link(tag_one.title, tag_path(tag_one))
    expect(page).to have_link(tag_two.title, tag_path(tag_two))
  end
end
