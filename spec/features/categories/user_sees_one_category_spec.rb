require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "HR")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("HR")
  end

  scenario "a user sees a list of all jobs in that category" do
    category = Category.create!(title: "HR")
    company = Company.create!(name:"dream job hq")
    first_job = Job.create!(title:"awesome", description:"job", level_of_interest: 8, company_id: company.id, city: "Phoenix", category_id: category.id)
    second_job = Job.create!(title:"awesomest", description:"jobb", level_of_interest: 10, company_id: company.id, city: "LA", category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("HR")
    expect(page).to have_link("awesome")
    expect(page).to have_link("awesomest")
  end
end
