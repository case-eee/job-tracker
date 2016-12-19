require 'rails_helper'

describe "User notices the navbar" do
  scenario "user clicks Companies on navbar" do

    visit('/dashboard')
    click_on 'Companies'
    # save_and_open_page

    expect(current_path).to eq('/companies')
  end

  scenario "user clicks categories on navbar" do

    visit('/dashboard')
    click_on 'Categories'
    # save_and_open_page

    expect(current_path).to eq('/categories')
  end

  scenario "user clicks Dashboard on navbar" do

    visit('/companies')
    click_on 'Dashboard'
    # save_and_open_page

    expect(current_path).to eq('/dashboard')
  end

  scenario "user clicks Locatin Analytics on navbar" do

    visit('/dashboard')
    click_on 'Location Analytics'
    # save_and_open_page

    expect(current_path).to eq('/jobs')
  end

  scenario "user clicks Interest Analytics on navbar" do

    visit('/dashboard')
    click_on 'Interest Analytics'
    # save_and_open_page

    expect(current_path).to eq('/jobs')
  end

end
