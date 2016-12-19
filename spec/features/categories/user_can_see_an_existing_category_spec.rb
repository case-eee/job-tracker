require 'rails_helper'

describe "User can see an existing category" do
  scenario "a user can see a category show page" do
    category = create(:category)
    job1, job2 = create_list(:job, 2, category_id: category.id)

    visit category_path(category)

    expect(page).to have_content(category.title)
    expect(Category.count).to eq(1)
  end
end
