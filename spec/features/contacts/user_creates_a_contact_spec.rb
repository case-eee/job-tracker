require "rails_helper"

describe "contacts #index" do
  before do
    FactoryGirl.reload
    create(:company, name: "Yeti")
    visit(new_company_contact_path(Company.first))
  end

  scenario "the user adds a contact to a company" do
    fill_in("contact[name]", with: "Don Johnson")
    fill_in("contact[position]", with: "Principal Engineer")
    fill_in("contact[email]", with: "donj@yetibikes.com")

    click_on("Create")
    expect(Contact.count).to eq(1)
  end

end
