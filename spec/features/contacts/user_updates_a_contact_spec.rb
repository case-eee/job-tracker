require "rails_helper"

describe "contact #edit" do
  before do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    create(:company, name: "Yeti")
    Company.first.contacts << create(:contact)
    visit(company_contacts_path(Company.first))
  end

  scenario "user updates all contact information" do
    click_on("Edit")
    fill_in("contact[name]", with: "Jimmy Johnson")
    fill_in("contact[position]", with: "Janitor")
    fill_in("contact[email]", with: "poopservices@yetibikes.com")
    click_on("Update")

    expect(Contact.first.name).to eq("Jimmy Johnson")
    expect(Contact.first.position).to eq("Janitor")
    expect(Contact.first.email).to eq("poopservices@yetibikes.com")
  end

  scenario "after updating a contact the user should see contact #show" do
    click_on("Edit")
    fill_in("contact[name]", with: "Jimmy Johnson")
    fill_in("contact[position]", with: "Janitor")
    fill_in("contact[email]", with: "poopservices@yetibikes.com")
    click_on("Update")
    contact = Company.first.contacts.first

    expect(page).to have_current_path(company_contact_path(Company.first, contact))
  end

end
