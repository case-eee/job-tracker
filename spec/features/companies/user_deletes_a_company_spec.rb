require 'rails_helper'

describe "company #destroy" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
  end
  scenario "a user can delete a company" do
    company = create(:company, name: "ESPN")
    visit companies_path
    expect(Company.count).to eq(1)
    within("tbody") do
      click_on("Delete", :match => :first)
    end

    expect(Company.count).to eq(0)
  end
end
