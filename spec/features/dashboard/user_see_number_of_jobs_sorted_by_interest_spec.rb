require 'rails_helper'

describe "average interest by job" do
  it "sort jobs by level of interest" do
    north_face = Company.create(name: "North Face")
    creative_assembly = Company.create(name: "Creative Assembly")
    mcdonalds = Company.create(name: "McDonald's")

    category = Category.create(title: "sample")

    job_1 = Job.create(title: "Wed Developer",  level_of_interest: 5, city: "Denver", category_id: category.id, company_id: north_face.id)
    job_2 = Job.create(title: "Wed Developer",  level_of_interest: 10, city: "Denver", category_id: category.id, company_id: north_face.id)
    job_3 = Job.create(title: "Game Designer", level_of_interest: 10, city: "Denver", category_id: category.id, company_id: creative_assembly.id)
    job_4 = Job.create(title: "Game Designer", level_of_interest: 9, city: "Denver", category_id: category.id, company_id: creative_assembly.id)
    job_5 = Job.create(title: "Fry Cook", level_of_interest: 5, city: "Denver", category_id: category.id, company_id: mcdonalds.id)
    job_6 = Job.create(title: "Fry Cook", level_of_interest: 6, city: "Denver", category_id: category.id, company_id: mcdonalds.id)


    visit dashboard_index_path

    expect(page).to have_content "2 Jobs with interest level: 5"
    expect(page).to have_content "2 Jobs with interest level: 10"
    expect(page).to have_content "1 Jobs with interest level: 6"
    expect(page).to have_content "1 Jobs with interest level: 9"
  end
end
