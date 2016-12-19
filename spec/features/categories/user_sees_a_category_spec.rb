require 'rails_helper'

RSpec.feature "User sees a category" do
  scenario "they see all of the jobs in the category" do
    job1, job2 = create_list(:job, 2)
    visit category_path(job1.category)

    expect(page).to have_content(job1.title)
  end
end