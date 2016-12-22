require "rails_helper"

describe "city #index" do

  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    create_list(:city,5)
    visit("/cities")
  end

  scenario "the user visit cities#index page" do
    expect(City.count).to eq(5)
    expect(page).to have_content("City_1")
    expect(page).to have_content("State_1")
    expect(page).to have_content("City_2")
    expect(page).to have_content("State_2")
    expect(page).to have_content("City_3")
    expect(page).to have_content("State_3")
    expect(page).to have_content("City_4")
    expect(page).to have_content("State_4")
    expect(page).to have_content("City_5")
    expect(page).to have_content("State_5")
  end
end

describe "the user can interact with the buttons" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    create_list(:city,5)
    visit("/cities")
  end


  it "the page should have a edit button for each city" do
    expect(page).to have_button("Edit")
  end

  it "the page should have a delete button for each city" do
    expect(page).to have_button("Delete")
  end


  scenario "should redirect them to the edit page" do
    within(".cities") do
      click_on("Edit", match: :first)
    end
    expect(page).to have_current_path(edit_city_path(City.first.id))
  end

  scenario "should redirect them to the delete page" do
    within(".cities") do
      click_on("Delete", match: :first)
    end
    expect(page).to have_current_path(cities_path)
  end
end
