require 'rails_helper'

RSpec.describe "User can see dashboard" do
  it "shows all required details" do
    visit "/dashboard"

    expect(page).to have_content("Job Count by LOI")
    expect(page).to have_content("Top Companies by LOI")
    expect(page).to have_content("Jobs by Location")
  end


end