require "rails_helper"

describe "city #destroy" do
  before do
    logged_as_user
  end

  scenario "a user can delete a city" do
    create(:city, name: "Denver", state: "Colorado")
    visit(cities_path(City.first))

    click_on("Delete")
    expect(City.count).to eq(0)
  end
end
