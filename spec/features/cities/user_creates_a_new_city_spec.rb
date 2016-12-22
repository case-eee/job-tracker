require "rails_helper"

describe "city #new" do

  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit("/cities/new")
    fill_in("Name", with: "Denver")
    fill_in("State", with: "Colorado")
    click_button("Create")
  end

  scenario "the user can create a new city" do
    expect(City.count).to eq(1)
  end

  scenario "a successful creation redirects user to the show page" do
    expect(page).to have_current_path(city_path(City.first.id))
    expect(page).to have_content("Denver")
  end

  context " the user attempts to create a city that already exists" do
    it "should redirect the user to the create page" do
      visit("/cities/new")
      fill_in("Name", with: "Denver")
      fill_in("State", with: "Colorado")
      click_button("Create")

      expect(page).to have_current_path(new_city_path)
    end
  end
end
