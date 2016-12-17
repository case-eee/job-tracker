require 'rails_helper'

describe "User can delete existing category" do
  scenario "from the Category Index page" do
    category1, category2 = create_list(:category, 2)
    visit categories_path

    expect(Category.count).to eq(2)

    within("tr:last") do
      expect(page).to have_link category2.title, href: category_path(category2)
      click_on "Delete"
    end

    expect(current_path).to eq(categories_path)
    expect(page).not_to have_link category2.title
    expect(Category.count).to eq(1)
  end
  scenario "from the Category details (Show) page" do
    category1, category2 = create_list(:category, 2)
    visit category_path(category1)

    expect(Category.count).to eq(2)
    
    click_on "Delete"

    expect(current_path).to eq(categories_path)
    expect(page).not_to have_link category1.title
    expect(Category.count).to eq(1)
  end
end