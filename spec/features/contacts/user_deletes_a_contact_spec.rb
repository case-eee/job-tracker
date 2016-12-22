require "rails_helper"

describe "contact #destroy" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
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
