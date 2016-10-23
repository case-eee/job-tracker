require 'rails_helper'

describe "User sees all tags" do
  scenario "a user sees all the tags" do
    tag_one, tag_two = create_list(:tag, 2)

    visit tags_path

    expect(page).to have_content(tag_one.title)
    expect(page).to have_content(tag_two.title)
  end

end
