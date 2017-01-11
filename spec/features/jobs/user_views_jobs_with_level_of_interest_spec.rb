require 'rails_helper'

describe "User visits job's interest page" do
  scenario "view all jobs sorted interest" do

    north_face = Company.create(name: "North Face")
    category   = Category.create(title: "sample")
    Job.create(title: "Developer", level_of_interest: 10, city: "Denver", category_id: category.id , company_id: north_face.id)
    Job.create(title: "Product Manager", level_of_interest: 5, city: "Denver", category_id: category.id ,company_id: north_face.id)


    visit dashboard_index_path

    click_on "Jobs Sorted by Interest"
    expect(page).to have_content "Jobs By Level of Interest"
    expect(page).to have_content "Developer level of interest: 10"

  end
end
