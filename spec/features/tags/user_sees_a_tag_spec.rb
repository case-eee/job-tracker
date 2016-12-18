require 'rails_helper'

describe "User sees all tags" do
  scenario "at index" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title:"HR")
    job = company.jobs.create!(title:"Developer", description:"make things", level_of_interest:3, company_id:company.id, city: "Denver", category_id:category.id)
    tag = Tag.create!(title:"fancy")
    Tagging.create!(tag_id:tag.id, job_id: job.id)
    
    visit tag_path(tag)

    expect(page).to have_content("fancy")
    expect(page).to have_content("ESPN - Developer")
  end
end