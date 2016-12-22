require 'rails_helper'

RSpec.feature "User deletes existing category" do
  scenario "a user can delete a category" do
    category = create(:category)

    visit category_path(category)
    click_link "Delete"

    expect(page).to have_content("#{category.title} was successfully deleted!")
    expect(current_path).to eq(categories_path)
  end
end
