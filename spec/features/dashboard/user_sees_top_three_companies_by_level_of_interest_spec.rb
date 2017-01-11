require 'rails_helper'

describe "average level of interest" do
  it "can pull top three companies by average level of interest" do
    north_face = Company.create(name: "North Face")
    creative_assembly = Company.create(name: "Creative Assembly")
    subaru = Company.create(name: "Subaru")
    category = Category.create(title: "sample")

    job_1 = Job.create(title: "Wed Developer",  level_of_interest: 5, city: "Denver", category_id: category.id, company_id: north_face.id)
    job_2 = Job.create(title: "Wed Developer",  level_of_interest: 10, city: "Denver", category_id: category.id, company_id: north_face.id)
    job_3 = Job.create(title: "Game Designer", level_of_interest: 10, city: "Denver", category_id: category.id, company_id: creative_assembly.id)
    job_4 = Job.create(title: "Game Designer", level_of_interest: 9, city: "Denver", category_id: category.id, company_id: creative_assembly.id)
    job_5 = Job.create(title: "Test Engineer", level_of_interest: 5, city: "Denver", category_id: category.id, company_id: subaru.id)
    job_6 = Job.create(title: "Test Engineer", level_of_interest: 6, city: "Denver", category_id: category.id, company_id: subaru.id)

    visit dashboard_index_path

    expect(page).to have_content "North Face's jobs"
    expect(page).to have_content "Creative Assembly's jobs"
    # expect(page).to have_content  "Subaru's jobs have a 5.5 average level of Interest"
  end
end
