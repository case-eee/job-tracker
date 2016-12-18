require "rails_helper"

describe "User edits an existing city" do

  before {FactoryGirl.reload}

  scenario "a user can edit a city" do
    city = create(:city)
    visit edit_city_path(city)

    expect(city.name).to eq("City_1")
    expect(city.state).to eq("State_1")

    fill_in("Name", with: "Jackson")
    fill_in("State", with: "Wyoming")
    click_button("Update")

    expect(current_path).to eq(city_path(city))
    expect(page).to have_content("Jackson")
    expect(page).to have_content("Wyoming")
  end
end
