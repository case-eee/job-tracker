require "rails_helper"

describe "Users can see all categories" do

  before do
    create_user_and_category
  end

  scenario "the user visit categories#index page" do
    expect(Category.count).to eq(5)
    Category.all.each do |category|
      expect(page).to have_content(category.title)
    end
  end

  def create_user_and_category
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    create_list(:category,5)
    visit("/categories")
  end
end
