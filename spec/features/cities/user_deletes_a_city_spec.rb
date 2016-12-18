require "rails_helper"

describe "city #destroy" do
  before {FactoryGirl.reload}

  scenario "a user can delete a city" do
    create(:city, name: "Denver", state: "Colorado")
    visit(cities_path(City.first))

    click_on("Delete")

    expect(page).to have_content("Denver, Colorado was successfully deleted!")
    expect(City.count).to eq(0)
  end
end
