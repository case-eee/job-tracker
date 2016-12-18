require 'rails_helper'

describe "User creates a contact" do
  scenario "user sees the contact on the show page" do
    company = Company.create(name: 'Best Buy')

    visit company_path(company)
    fill_in 'contact[name]', with: 'Bilbo'
    fill_in 'contact[position]', with: 'Ring Bearer'
    fill_in 'contact[email]', with: 'yolo_swag_ring@email.com'
    click_on 'Create Contact'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Bilbo")
    expect(page).to have_content("Ring Bearer")
    expect(page).to have_content("yolo_swag_ring@email.com")
  end

  scenario "user creates an invalid contact" do
    company = Company.create(name: 'Best Buy')

    visit company_path(company)
    fill_in 'contact[name]', with: 'Bilbo'
    fill_in 'contact[position]', with: 'Ring Bearer'
    fill_in 'contact[email]', with: 'yolo_swag_ring@email.com'
    click_on 'Create Contact'
    fill_in 'contact[name]', with: 'Frodo'
    fill_in 'contact[email]', with: 'ring_of_power@email.com'
    click_on 'Create Contact'

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content('Bilbo')
    expect(page).to have_content('Ring Bearer')
    expect(page).to have_content('yolo_swag_ring@email.com')
    expect(page).to_not have_content('Frodo')
    expect(page).to_not have_content('ring_of_power@email.com')
  end
end
