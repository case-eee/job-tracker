require 'rails_helper'

describe "When a user visits a job page" do
  before do
    category1 = Category.create(title: "Business")
    @company = Company.create(name: "RockTenn")
    @job = @company.jobs.create(title: "CEO",
                                description: "The boss.",
                                level_of_interest: 2,
                                city: "Denver",
                                category_id: "#{category1.id}")
    @comment1 = @job.comments.create(content: "This is a cool job!")
    @comment2 = @job.comments.create(content: "I will contact them soon.")
    visit company_job_path(@company, @job)
  end

  it "they see the job and its comments" do
    expect(page).to have_content("CEO")
    expect(page).to have_content("The boss.")
    expect(page).to have_content("This is a cool job!")
    expect(page).to have_content("I will contact them soon.")
  end
end
