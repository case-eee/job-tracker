require 'rails_helper'

describe "User sees all tags" do
  scenario "at index" do
    tag = Tag.create!(title:"fancy")
    tag = Tag.create!(title:"feast")
    tag = Tag.create!(title:"please")

    visit tags_path

    expect(page).to have_link("fancy")
    expect(page).to have_link("feast")
    expect(page).to have_link("please")
  end
end