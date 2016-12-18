require "rails_helper"

describe "contact #destroy" do
  before do
    FactoryGirl.reload
    create(:company, name: "Yeti")
    Company.first.contacts << create(:contact)
    visit(company_contacts_path(Company.first))
  end

  scenario "the user deletes a contact" do
    expect(Contact.count).to eq(1)
    click_on("Delete")

    expect(Contact.count).to eq(0)
  end

end
