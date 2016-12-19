require "rails_helper"

describe "category #destroy" do
  before {FactoryGirl.reload}

  scenario "a user can delete a category" do
    create(:category, title: "Cobbler")
    visit(categories_path(Category.first))
    within("tbody") do
      click_on("Delete", :match => :first)
    end

    expect(Category.count).to eq(0)
  end
end
