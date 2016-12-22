require "rails_helper"

describe "city #edit" do
  before do
    logged_as_user
    create_city_and_visit_edit_city_path
  end

  scenario "a user can edit a city" do
    expect(City.first.name).to eq("City_1")
    expect(City.first.state).to eq("State_1")

    fill_in("Name", with: "Jackson")
    fill_in("State", with: "Wyoming")
    click_button("Update")

    expect(City.first.name).to eq("Jackson")
    expect(City.first.state).to eq("Wyoming")
    expect(current_path).to eq(city_path(City.first))
    expect(page).to have_content("Jackson")
    expect(page).to have_content("Wyoming")
  end
end
