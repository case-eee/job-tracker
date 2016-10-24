require 'rails_helper'

describe "User sees one tag" do
  scenario "a user sees a tag" do
    tag = create(:tag_with_jobs)

    visit tag_path(tag)

    expect(current_path).to eq(tag_path(tag))
    expect(page).to have_content(tag.title)
    expect(page).to have_content(tag.jobs.first.title)
    expect(page).to have_content(tag.jobs.last.title)
  end
end
