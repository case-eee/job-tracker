require "rails_helper"

describe "city #index" do

  before do
    logged_as_user
    create_cities_and_visit_cities
  end

  scenario "the user visits cities#index page and should view all cities" do
    City.all.each do |city|
      expect(page).to have_content(city.name)
      expect(page).to have_content(city.state)
    end
    expect(City.count).to eq(5)
  end
end

describe "the user can interact with the buttons" do
  before do
    logged_as_user
    create_cities_and_visit_cities
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
