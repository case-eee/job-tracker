require 'rails_helper'

RSpec.describe "Welcome page" do
  scenario "welcome page loads as root" do
    visit welcome_index_path

    expect(page).to have_css("img")
    expect(page).to have_link("Companies")
    expect(page).to have_link("Job Categories")
  end
end