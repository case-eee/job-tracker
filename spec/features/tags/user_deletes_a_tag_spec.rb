require 'rails_helper'

describe "User deletes existing tag" do
  scenario "a user can delete a tag" do
    tag = create(:tag)
    visit tags_path

    within(".tag_#{tag.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("#{tag.title} was successfully deleted!")
  end
end
