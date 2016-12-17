require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create(name: "Web Developer")

    visit category_path(category)

    expect(page).to have_content(category.name)
  end

  scenario "user returns to categories index" do
    category = Category.create(name: "Web Developer")

    visit category_path(category)
    click_on '<< Categories'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(category.name)
  end

  scenario "user wants to see the jobs associated with that category" do
    company  = Company.create(name: "ESPN")
    category = Category.create(name: "Web Developer")
    job      = company.jobs.create(title: "Gutter Sniffer", level_of_interest: 7, city: 'Denver')
    job.update(category_id: category.id)
    
    visit category_path(category)
    click_on 'Gutter Sniffer'

    expect(page).to have_content('Gutter Sniffer')
    expect(page).to have_content('Denver')
    expect(page).to have_content(7)
  end
end
